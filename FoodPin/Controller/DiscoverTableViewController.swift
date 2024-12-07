//
//  DiscoverTableViewController.swift
//  FoodPin
//
//  Created by Myung Woo on 11/18/24.
//

import UIKit
import CloudKit

class DiscoverTableViewController: UITableViewController {

    var restaurants: [CKRecord] = []
    
    var spinner = UIActivityIndicatorView()
    
    private var imageCache = NSCache<CKRecord.ID, NSURL>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinner.style = .medium
        spinner.hidesWhenStopped = true
        view.addSubview(spinner)
        
        refreshControl = UIRefreshControl()
        refreshControl?.backgroundColor = UIColor.white
        refreshControl?.tintColor = UIColor.gray
        refreshControl?.addTarget(self, action: #selector(fetchRecordsFromCloud), for: UIControl.Event.valueChanged)
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate( [ spinner.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150.0),
                                       spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        
        spinner.startAnimating()

        tableView.cellLayoutMarginsFollowReadableWidth = true
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Customize the navigation bar appearance
        if let appearance = navigationController?.navigationBar.standardAppearance {

            appearance.configureWithTransparentBackground()

            if let customFont = UIFont(name: "Nunito-Bold", size: 45.0) {

                appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "NavigationBarTitle")!]
                appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "NavigationBarTitle")!, .font: customFont]
            }

            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
        
        fetchRecordsFromCloud()
        
        print(restaurants.count)
        tableView.dataSource = dataSource
    }
    
    func configureDataSource() -> UITableViewDiffableDataSource<Section, CKRecord> {
        
        let cellIdentifier = "discovercell"

        let dataSource = UITableViewDiffableDataSource<Section, CKRecord>(tableView: tableView) { (tableView, indexPath, restaurant) -> UITableViewCell? in

            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

            cell.textLabel?.text = restaurant.object(forKey: "name") as? String
            
            cell.imageView?.image = UIImage(systemName: "photo")
            cell.imageView?.tintColor = .black
            
            if let imageFileURL = self.imageCache.object(forKey: restaurant.recordID) {
                        // Fetch image from cache
                print("Get image from cache")
                if let imageData = try? Data.init(contentsOf: imageFileURL as URL) {
                    cell.imageView?.image = UIImage(data: imageData)
                }

            } else {
                // Fetch Image from Cloud in background
                let publicDatabase = CKContainer.default().publicCloudDatabase
                let fetchRecordsImageOperation = CKFetchRecordsOperation(recordIDs: [restaurant.recordID])
                fetchRecordsImageOperation.desiredKeys = ["image"]
                fetchRecordsImageOperation.queuePriority = .veryHigh
                
                fetchRecordsImageOperation.perRecordResultBlock = { (recordID, result) in
                    do {
                        let restaurantRecord = try result.get()
                        
                        if let image = restaurantRecord.object(forKey: "image"),
                           let imageAsset = image as? CKAsset {
                            
                            if let imageData = try? Data.init(contentsOf: imageAsset.fileURL!) {
                                
                                // Replace the placeholder image with the restaurant image
                                DispatchQueue.main.async {
                                    cell.imageView?.image = UIImage(data: imageData)
                                    cell.setNeedsLayout()
                                }
                                
                                // Add the image URL to cache
                                self.imageCache.setObject(imageAsset.fileURL! as NSURL, forKey: restaurant.recordID)
                            }
                        }
                    } catch {
                        print("Failed to get restaurant image: \(error.localizedDescription)")
                    }
                }
                
                publicDatabase.add(fetchRecordsImageOperation)
            }
            
            return cell
        }

        return dataSource
    }
    
    lazy var dataSource = configureDataSource()
    
    @objc func fetchRecordsFromCloud() {

        // Fetch data using Convenience API
        let cloudContainer = CKContainer.default()
        let publicDatabase = cloudContainer.publicCloudDatabase
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Restaurant", predicate: predicate)
        query.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        let queryOperation = CKQueryOperation(query: query)
        queryOperation.desiredKeys = ["name"]
        queryOperation.queuePriority = .veryHigh
        queryOperation.resultsLimit = 50
        queryOperation.recordMatchedBlock = { (recordID, result) -> Void in
            do {
                if let _ = self.restaurants.first(where: { $0.recordID == recordID }) {
                    return
                }

                self.restaurants.append(try result.get())
            } catch {
                print(error)
            }
        }
        
        queryOperation.queryResultBlock = {
            [unowned self] result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success:
                print("Successfully retrieve the data from iCloud")
                self.updateSnapshot()
            }
            
            DispatchQueue.main.async {
                self.spinner.stopAnimating()
                
                if let refreshControl = self.refreshControl {
                    if refreshControl.isRefreshing {
                        refreshControl.endRefreshing()
                    }
                }
            }
        }

        //let results = try await publicDatabase.records(matching: query)

//        for record in results.matchResults {
//            self.restaurants.append(try record.1.get())
//        }

        publicDatabase.add(queryOperation)

    }
    
    func updateSnapshot(animatingChange: Bool = false){
        var snapshot = NSDiffableDataSourceSnapshot<Section, CKRecord>()
        snapshot.appendSections([.all])
        snapshot.appendItems(restaurants, toSection: .all)
        
        dataSource.apply(snapshot,animatingDifferences: false)
    }

}
