//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Myung Woo on 7/15/24.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
    //var restaurant: Restaurant = Restaurant()
    var restaurant: Restaurant!
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.hidesBarsOnSwipe = false
        
        navigationItem.backButtonTitle = ""

        tableView.contentInsetAdjustmentBehavior = .never
        
        // Configure header view
        headerView.nameLabel.text = restaurant.name
        headerView.typeLabel.text = restaurant.type
        headerView.headerImageView.image = UIImage(data: restaurant.image)
        
//        let heartImage = restaurant.isFavorite ? "heart.fill" : "heart"
//        headerView.heartButton.tintColor = restaurant.isFavorite ? .systemYellow : .white
//        headerView.heartButton.setImage(UIImage(systemName: heartImage), for: .normal)
        
        let favoriteButtonText = restaurant.isFavorite ? "heart.fill" : "heart"
        favoriteButton.tintColor = restaurant.isFavorite ? .systemYellow : .white
        favoriteButton.image = UIImage(systemName: favoriteButtonText)
        //favoriteButton.setImage(UIImage(systemName: favoriteButtonText), for: .normal)
     
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        
        // display rating image
        if let rating = restaurant.rating {
            headerView.ratingImageView.image = UIImage(named: rating.image)
        }
    }
    //MARK: ViewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: RestaurantDetailHeaderView!
    
//    @IBOutlet var restaurantImageView: UIImageView!
//    @IBOutlet var detailName: UILabel!
//    @IBOutlet var detailType: UILabel!
//    @IBOutlet var detailLocation: UILabel!
//
//    var restaurantImageName = ""
//    var detailNameText = ""
//    var detailTypeText = ""
//    var detailLocationText = ""

    
    
    // MARK: Close button
    @IBAction func close(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Favotite Button
    @IBOutlet var favoriteButton: UIBarButtonItem!
    @IBAction func favoriteTapped(sender: UIButton ){
        restaurant.isFavorite = restaurant.isFavorite ? false : true
        let favoriteButtonText = restaurant.isFavorite ? "heart.fill" : "heart"
        favoriteButton.tintColor = restaurant.isFavorite ? .systemYellow : .white
        favoriteButton.image = UIImage(systemName: favoriteButtonText)
        //favoriteButton.setImage(UIImage(systemName: favoriteButtonText), for: .normal) -> only for UIButton
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            appDelegate.saveContext()
        }
    }
    
    // MARK: Rate Button
    @IBAction func rateRestaurant(segue: UIStoryboardSegue){
        guard let identifier = segue.identifier else {
            return
        }
        
//        basicly get rating information
//        if let rating = Restaurant.Rating(rawValue: identifier) {
//            self.restaurant.rating = rating
//            self.headerView.ratingImageView.image = UIImage(named: rating.image)
//        }
//        
//        dismiss(animated: true, completion: nil)
        
        // add a subtle animation
        dismiss(animated: true, completion: {
            if let rating = Restaurant.Rating(rawValue: identifier) {
                self.restaurant.rating = rating
                self.headerView.ratingImageView.image = UIImage(named: rating.image)
                
                if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
                    appDelegate.saveContext()
                }
                
            }
  
            let scaleTransform = CGAffineTransform.init(scaleX: 0.1, y: 0.2)
            self.headerView.ratingImageView.transform =  scaleTransform
            self.headerView.ratingImageView.alpha = 0
            
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.7, options: [], animations: {
                self.headerView.ratingImageView.transform = .identity
                self.headerView.ratingImageView.alpha = 1
            }, completion: nil)
        })
    }
}

extension RestaurantDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTextCell.self), for: indexPath) as! RestaurantDetailTextCell
            
            cell.descriptionLabel.text = restaurant.summary
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTwoColumnCell.self), for: indexPath) as! RestaurantDetailTwoColumnCell
            
            cell.column1TitleLabel.text = "Address"
            cell.column1TextLabel.text = restaurant.location
            cell.column2TitleLabel.text = "Phone"
            cell.column2TextLabel.text = restaurant.phone
            
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailMapCell.self), for: indexPath) as! RestaurantDetailMapCell
            cell.configure(location: restaurant.location)
            cell.selectionStyle = .none
            
            return cell
            
        default:
            fatalError("Failed to instantiate the table cell for detail view controller")
            
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "showMap":
            let destinationController = segue.destination as! MapViewController
            destinationController.restaurant = restaurant
            
        case "showReview":
            let destinationController = segue.destination as! ReviewViewController
            destinationController.restaurant = restaurant
            
        default: break
        }
        
    }
}


