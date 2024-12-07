//
//  AboutTableViewController.swift
//  FoodPin
//
//  Created by Myung Woo on 9/9/24.
//

import UIKit
import SafariServices

class AboutTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
           
        //Navigation
        navigationController?.navigationBar.prefersLargeTitles = true
        
        if let appearance = navigationController?.navigationBar.standardAppearance {
            appearance.configureWithTransparentBackground()
            
            if let customFont = UIFont(name:"Nunito-Bold", size: 45.0){
                appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "NavigationBarTitle")!]
                appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "NavigationBarTitle")!, .font: customFont]
            }
            
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
        }
        
        // Load table data
        tableView.dataSource = dataSource
        updateSnapshot()

    }

    enum Section{
        case feedback
        case followus
    }
    
    struct LinkItem: Hashable {
        var text: String
        var link: String
        var image: String
    }
    
    var sectionContent = [
        [ LinkItem(text: "Rate us on App Store", link: "https://www.apple.com/ios/appstore/", image: "store"),
        LinkItem(text: "Tell us your feedback", link: "http://www.appcoda.com/contact", image: "chat")],
        [ LinkItem(text: "Twitter", link: "https://twitter.com/appcodamobile", image: "twitter"),
        LinkItem(text: "Facebook", link: "https://facebook.com/appcodamobile", image: "facebook"),
        LinkItem(text: "Instagram", link: "https://instagram.com/appcodamobile", image: "instagram")
        ]
    ]
    
    func configureDataSource() -> UITableViewDiffableDataSource<Section, LinkItem> {
        let cellIdentifier = "aboutcell"
        
        let dataSource = UITableViewDiffableDataSource<Section, LinkItem>(tableView: tableView) {
            (tableView, indexPath, LinkItem) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,for: indexPath)
            cell.textLabel?.text = LinkItem.text
            cell.imageView?.image = UIImage(named: LinkItem.image)
            return cell
        }
        return dataSource
    }
    
    func updateSnapshot() {
        // create a snapshot and populate the data
        var snapshot = NSDiffableDataSourceSnapshot<Section, LinkItem>()
        snapshot.appendSections([.feedback, .followus])
        snapshot.appendItems(sectionContent[0], toSection: .feedback)
        snapshot.appendItems(sectionContent[1], toSection: .followus)
        
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    lazy var dataSource = configureDataSource()
    
    // Select row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Option 1: Move into Safari app
        // Get the selected link item
//        guard let linkItem = self.dataSource.itemIdentifier(for: indexPath) else {
//            return
//        }
//        
//        if let url = URL(string: linkItem.link){
//            UIApplication.shared.open(url)
//        }
        
        // Option2: using wkWebView
        //performSegue(withIdentifier: "showWebView", sender: self)
        
        // Option3: UISafariViewController
        switch indexPath.section{
        case 0: performSegue(withIdentifier: "showWebView", sender: self)
        case 1: openWithSafariViewController(indexPath: indexPath)
            
        default: break
        }
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showWebView" {
            if let destinationController = segue.destination as? WebViewController,
               let indexPath = tableView.indexPathForSelectedRow,
               let linkItem = self.dataSource.itemIdentifier(for: indexPath){
                destinationController.targetURL = linkItem.link
            }
        }
    }
    
    func openWithSafariViewController(indexPath: IndexPath) {
        guard let linkItem = self.dataSource.itemIdentifier(for: indexPath) else {
            return
        }
        
        if let url = URL(string: linkItem.link) {
            let safariController = SFSafariViewController(url: url)
            present(safariController, animated: true, completion: nil)
        }
    }
    
}
