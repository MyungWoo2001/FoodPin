//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Myung Woo on 7/5/24.
//

import UIKit
import CoreData

class RestaurantTableViewController: UITableViewController {

//    var restaurantNames = ["Cafe Deadend", "Homei",
//                           "Teakha", "Cafe Loisl","Petite Oyster", "For Kee Restaurant",
//                           "Po's Atelier", "Bourke street Bakery", "Haigh's Chocolate",
//                           "Palomino Espresso","Upstate", "Traif", "Graham Avenue Meats",
//                           "Waffle & Wolf","Five Leaves", "cafe Lore", "Confessional",
//                           "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
//    
//    var restaurantImages = ["cafedeadend", "homei",
//                            "teakha", "cafeloisl","petiteoyster","forkee",
//                            "posatelier", "bourkestreetbakery","haigh",
//                            "palomino", "upstate","traif","graham",
//                            "waffleandwolf","fiveleaves","cafelore","confessional",
//                            "barrafina","donostia","royaloak","cask"]
//    
//    var restaurantLocations = ["Hong Kong","Hong Kong", "Hong Kong","Hong Kong","Hong Kong",
//                              "Hong Kong","Hong Kong", "Sydney", "Sydney","Sydney",
//                              "New York","New York","New York", "New York", "New York","New York",
//                              "London","London","London","London","london"]
//    
//    var restaurantTypes = ["Coffee & Tea Shop","Cafe","Tea House","Austrian / Causual Drink","French",
//                           "Bakery","Chocolate","Cafe","American Sea food","American","American","Breakfast & Brunch",
//                           "Coffer & Tea","Coffee & Tea", "Latin American", "Spanish", "Spanish", "British","Thai","vietnam","vietnam"]
//    
//    var restaurantIsFavorites = Array(repeating: false, count: 21)
    
//    var restaurants:[Restaurant] = [
//        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong", phone: "232-923423", description: "Searching for great breakfast eateries and coffee? This place is for you. We open at 6:30 every morning, and close at 9 PM. We offer espresso and espresso based drink, such as capuccino, cafe latte, piccolo and many more. Come over and enjoy a great meal.", image: "cafedeadend", isFavorite: false, rating: .awesome),
//        Restaurant(name: "Homei", type: "Cafe", location: "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong", phone: "348-233423", description: "A little gem hidden at the corner of the street is nothing but fantastic! This place is warm and cozy. We open at 7 every morning except Sunday, and close at 9 PM. We offer a variety of coffee drinks and specialties including lattes, cappuccinos, teas, and more. We serve breakfast, lunch, and dinner in an airy open setting. Come over, have a coffee and enjoy a chit-chat with our baristas.", image: "homei", isFavorite: false, rating: .awesome),
//        Restaurant(name: "Teakha", type: "Tea House", location: "Shop B, 18 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phone: "354-243523", description: "Take a moment to stop and smell tealeaves! We are about the community, our environment, and all things created by the warmth of our hands. We open at 11 AM, and close at 7 PM. At teakha, we sell only the best single-origin teas sourced by our sister company Plantation directly from small tea plantations. The teas are then either cooked to perfection with milk in a pot or brewed.", image: "teakha", isFavorite: false, rating: .awesome),
//        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Shop B, 20 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phone: "453-333423", description: "A great cafe in Austrian style. We offer espresso and espresso based drink, such as capuccino, cafe latte, piccolo and many more. We also serve breakfast and light lunch. Come over to enjoy the elegant ambience and quality coffee.", image: "cafeloisl", isFavorite: false, rating: .awesome),
//        Restaurant(name: "Petite Oyster", type: "French", location: "24 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phone: "983-284334", description: "An upscale dining venue, features premium and seasonal imported oysters, and delicate yet creative modern European cuisines. Its oyster bar displays a full array of freshest oysters imported from all over the world including France, Australia, USA and Japan.", image: "petiteoyster", isFavorite: false, rating: .awesome),
//        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Shop J-K., 200 Hollywood Road, SOHO, Sheung Wan, Hong Kong", phone: "232-434222", description: "A great local cafe for breakfast and lunch! Located in a quiet area in Sheung Wan, we offer pork chop buns, HK french toast, and many more. We open from 7 AM to 4:30 PM.", image: "forkee", isFavorite: false, rating: .awesome),
//        Restaurant(name: "Po's Atelier", type: "Bakery", location: "G/F, 62 Po Hing Fong, Sheung Wan, Hong Kong", phone: "234-834322", description: "A boutique bakery focusing on artisan breads and pastries paired with inspiration from Japan and Scandinavia. We are crazy about bread and excited to share our artisan bakes with you. We open at 10 every morning, and close at 7 PM.", image: "posatelier", isFavorite: false, rating: .awesome),
//        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "633 Bourke St Sydney New South Wales 2010 Surry Hills", phone: "982-434343", description: "We make everything by hand with the best possible ingredients, from organic sourdoughs to pastries and cakes. A combination of great produce, good strong coffee, artisanal skill and hard work creates the honest, soulful, delectable bites that have made Bourke Street Bakery famous. Visit us at one of our many Sydney locations!", image: "bourkestreetbakery", isFavorite: false, rating: .awesome),
//        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "412-414 George St Sydney New South Wales", phone: "734-232323", description: "Haigh's Chocolates is Australia's oldest family owned chocolate maker. We have been making chocolate in Adelaide, South Australia since 1915 and we are committed to the art of premium chocolate making from the cocoa bean. Our chocolates are always presented to perfection in our own retail stores. Visit any one of them and you'll find chocolate tasting, gift wrapping and personalised attention are all part of the service.", image: "haigh", isFavorite: false, rating: .awesome),
//        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Shop 1 61 York St Sydney New South Wales", phone: "872-734343", description: "We offer an assortment of on-site baked goods and sandwiches. This place has always been a favourite among office workers. We open at 7 every morning including Sunday, and close at 4 PM. Come over, have a coffee and enjoy a chit-chat with our baristas.", image: "palomino", isFavorite: false, rating: .awesome),
//        Restaurant(name: "Upstate", type: "American", location: "95 1st Ave New York, NY 10003", phone: "343-233221", description: "The absolute best seafood place in town. The atmosphere here creates a very homey feeling. We open at 5 PM, and close at 10:30 PM.", image: "upstate", isFavorite: false, rating: .awesome),
//        Restaurant(name: "Traif", type: "American", location: "229 S 4th St Brooklyn, NY 11211", phone: "985-723623", description: "A young crowd populates this pork-focused American eatery in an older Williamsburg neighborhood. We open at 6PM, and close at 11 PM. If you enjoy a shared small plates dinner experience, come over and have a try.", image: "traif", isFavorite: false, rating: .awesome),
//        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "445 Graham Ave Brooklyn, NY 11211", phone: "455-232345", description: "Classic Italian deli & butcher draws patrons with meat-filled submarine sandwiches. We use the freshest meats and veggies to create the perfect panini for you. We look forward to seeing you!", image: "graham", isFavorite: false, rating: .awesome),
//        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "413 Graham Ave Brooklyn, NY 11211", phone: "434-232322", description: "Small shop, some seating, definitely something different! We open at 7 every morning except Sunday, and close at 9 PM. We offer a variety of waffles with choices of sweet & savory fillings. If you are gluten free and craving waffles, this is the place to go.", image: "waffleandwolf", isFavorite: false, rating: .awesome),
//        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "18 Bedford Ave Brooklyn, NY 11222", phone: "343-234553", description: " Great food, cocktails, ambiance, service. Nothing beats having a warm dinner and a whiskey. We open at 8 every morning, and close at 1 AM. The ricotta pancakes are something you must try.", image: "fiveleaves", isFavorite: false, rating: .awesome),
//        Restaurant(name: "Cafe Lore", type: "Latin American", location: "Sunset Park 4601 4th Ave Brooklyn, NY 11220", phone: "342-455433", description: "Good place, great environment and amazing food! We open at 10 every morning except Sunday, and close at 9 PM. Give us a visit! Enjoy mushroom raviolis, pumpkin raviolis, meat raviolis with sausage and peppers, pork cutlets, eggplant parmesan, and salad.", image: "cafelore", isFavorite: false, rating: .awesome),
//        Restaurant(name: "Confessional", type: "Spanish", location: "308 E 6th St New York, NY 10003", phone: "643-332323", description: "Most delicious cocktail you would ever try! Our menu includes a wide range of high quality internationally inspired dishes, vegetarian options, and local cuisine. We open at 10 AM, and close at 10 PM. We welcome you into our place to enjoy a meal with your friends.", image: "confessional", isFavorite: false, rating: .awesome),
//        Restaurant(name: "Barrafina", type: "Spanish", location: "54 Frith Street London W1D 4SL United Kingdom", phone: "542-343434", description: "a collection of authentic Spanish Tapas bars in Central London! We have an open kitchen, a beautiful marble-topped bar where guests can sit and watch the chefs at work and stylish red leather stools. Lunch starts at 1 PM. Dinners starts 5:30 PM.", image: "barrafina", isFavorite: false, rating: .awesome),
//        Restaurant(name: "Donostia", type: "Spanish", location: "10 Seymour Place London W1H 7ND United Kingdom", phone: "722-232323", description: "Very good basque food, creative dishes with terrific flavors! Donostia is a high end tapas restaurant with a friendly relaxed ambiance. Come over to enjoy awesome tapas!", image: "donostia", isFavorite: false, rating: .awesome),
//        Restaurant(name: "Royal Oak", type: "British", location: "2 Regency Street London SW1P 4BZ United Kingdom", phone: "343-988834", description: "Specialise in great pub food. Established in 1872, we have local and world lagers, craft beer and a selection of wine and spirits for people to enjoy. Don't forget to try our range of Young's Ales and Fish and Chips.", image: "royaloak", isFavorite: false, rating: .awesome),
//        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "22 Charlwood Street London SW1V 2DY Pimlico", phone: "432-344050", description: "With kitchen serving gourmet burgers. We offer food every day of the week, Monday through to Sunday. Join us every Sunday from 4:30 – 7:30pm for live acoustic music!", image: "cask", isFavorite: false, rating: .awesome)
//    ]
    
    @IBOutlet var emptyRestaurantView: UIView!
    
    var restaurants: [Restaurant] = []
    
    var searchController: UISearchController!
    
    
    // MARK: - View controller lifer cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get data from data store
        fetchRestaurantData()
        // Set font and color
        if let appearance = navigationController?.navigationBar.standardAppearance{
            appearance.configureWithTransparentBackground()
            if let customFont = UIFont(name:"Nunito-Bold", size: 45.0 ) {
//                appearance.titleTextAttributes = [.foregroundColor: UIColor(red: 218/255, green: 96/255, blue: 51/255, alpha: 1.0)]
//                appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(red: 219/255, green: 96/255, blue: 51/255, alpha: 1.0), .font: customFont]
//                appearance.titleTextAttributes = [.foregroundColor: UIColor(red: 218, green: 96, blue: 51)]
//                appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(red: 219, green: 96, blue: 51), .font: customFont]
                appearance.titleTextAttributes = [.foregroundColor : UIColor(named: "NavigationBarTitle")!]
                appearance.largeTitleTextAttributes = [.foregroundColor : UIColor(named: "NavigationBarTitle")!, .font: customFont]
            }
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
        // Prepare the empty view
        tableView.backgroundView = emptyRestaurantView
        tableView.backgroundView?.isHidden = restaurants.count == 0 ? false : true
        // Swipe bar
        navigationController?.hidesBarsOnSwipe = true
        // Navigation
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.prefersLargeTitles = true
        // Match table to screen
        tableView.cellLayoutMarginsFollowReadableWidth = true
        tableView.separatorStyle = .none
        tableView.dataSource = dataSource
        // Search bar
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.tintColor = UIColor(named: "NavigationBarTitle")
        tableView.tableHeaderView = searchController.searchBar
        //self.navigationItem.searchController = searchController
    }
    
    //  viewWillAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.hidesBarsOnSwipe = true
        // Walkthrough
        if UserDefaults.standard.bool(forKey: "hasViewedWalkthrough"){
            return
        }
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        if let walkthroughViewController = storyboard.instantiateViewController(withIdentifier: "WalkthroughViewController") as? WalkthroughViewController{
            present(walkthroughViewController, animated: true, completion: nil)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK:close button
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
        
    // MARK: - UITableView Diffable Data Source
    func configureDataSource() -> RestaurantDiffableDataSource{
        let cellIdentifer = "datacell"
        let dataSource = RestaurantDiffableDataSource(
        tableView: tableView,
        cellProvider: { tableView, indexPath, restaurant in
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer, for: indexPath) as! RestaurantTableViewCell
            cell.nameLabel.text = restaurant.name
            cell.thumbnailImageView.image = UIImage(data: restaurant.image)
            cell.locationLabel.text = restaurant.location
            cell.typeLabel.text = restaurant.type
            //cell.accessoryType = self.restaurantIsFavorites[indexPath.row] ? .checkmark : .none
            cell.heartImage.isHidden = restaurant.isFavorite ? false : true
            return cell
            }
        )
        return dataSource
    }
    lazy var dataSource = configureDataSource()
    
    // MARK: Display new restaurant
    var fetchResultController: NSFetchedResultsController<Restaurant>!
    func fetchRestaurantData(searchText: String = "") {
        // Fetch data from data store
        let fetchRequest: NSFetchRequest<Restaurant> = Restaurant.fetchRequest()
        
        if !searchText.isEmpty {
            let predicate1 = NSPredicate(format: "name CONTAINS[c]%@", searchText)
            let predicate2 = NSPredicate(format: "type CONTAINS[c]%@", searchText)
            let predicate3 = NSPredicate(format: "location CONTAINS[c]%@", searchText)
            
            let compoundPredicate = NSCompoundPredicate(orPredicateWithSubpredicates: [predicate1,predicate2,predicate3])
            fetchRequest.predicate = compoundPredicate
            
        }
        
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = appDelegate.persistentContainer.viewContext
            fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            fetchResultController.delegate = self
            do {
                try fetchResultController.performFetch()
                updateSnapshot(animatingChange: searchText.isEmpty ? false: true)
            } catch {
                print(error)
            }
        }
    }
    func updateSnapshot(animatingChange: Bool = false){
        if let fetchedObjects = fetchResultController.fetchedObjects{
            restaurants = fetchedObjects
        }
        // Create a snapshot and populate the data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Restaurant>()
        snapshot.appendSections([.all])
        snapshot.appendItems(restaurants, toSection: .all)
        
        dataSource.apply(snapshot, animatingDifferences: animatingChange)
        
        tableView.backgroundView?.isHidden = restaurants.count == 0 ? false : true
    }
    
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
//        
//        //Creat an option menu as an action sheet
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
//        if let popoverController = optionMenu.popoverPresentationController {
//            if let cell = tableView.cellForRow(at: indexPath ) {
//                popoverController.sourceView = cell
//                popoverController.sourceRect = cell.bounds
//            }
//        }
//        
//        //Add actions to the menu
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        optionMenu.addAction(cancelAction)
//        
//        //Add "Reserve a table" action
//        let reserveActionHandler = { (action:UIAlertAction!) -> Void in
//            
//            let alertMessage = UIAlertController(title: "Not available yet", message: "Sorry , this feature is not available yet. Please retry later!!", preferredStyle: .alert)
//            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            self.present(alertMessage, animated: true, completion: nil)
//        }
//        
//            
//        let reserveAction = UIAlertAction(title: "Reserve a table", style: .default, handler: reserveActionHandler)
//        optionMenu.addAction(reserveAction)
//        
//        //Add "Mark as favorite" action
//        let favoriteTitle = restaurants[indexPath.row].isFavorite ? "Remove from favorites" : "Mark as favorites"
//        let favoriteAction = UIAlertAction(title: favoriteTitle, style: .default, handler: {
//            (action:UIAlertAction!) -> Void in
//            
//            let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
//            
//            cell.heartImage.isHidden = self.restaurants[indexPath.row].isFavorite
//            
//            self.restaurants[indexPath.row].isFavorite = self.restaurants[indexPath.row].isFavorite ? false : true
//            
//        })
//        optionMenu.addAction(favoriteAction)
//        
//        //Display Menu
//        present(optionMenu, animated: true, completion:nil)
//        
//        //Deselect the row
//        tableView.deselectRow(at: indexPath, animated: false)
//        
//        
//    }
    
    // MARK: trailingSwipeActionsConfigurationForRowAt
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // Disable while in search mode
        if searchController.isActive {
            return UISwipeActionsConfiguration()
        }
        //Get the selected restaurant
        guard let restaurant = self.dataSource.itemIdentifier(for: indexPath) else {
            return UISwipeActionsConfiguration()
        }
        //Delete action
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){ (action, sourceView, completionHandler) in
            if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
                let context = appDelegate.persistentContainer.viewContext
                // Delete the item
                context.delete(restaurant)
                appDelegate.saveContext()
                // Update the view
                self.updateSnapshot(animatingChange: true)
            }
            //call completion handler to dismiss the action button
            completionHandler(true)
        }
        // share action
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceView, completionHandler) in
            let defaultText = "Just checking in at " + restaurant.name
            //let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            let activityController: UIActivityViewController
            if let imageToShare = UIImage(data: restaurant.image){
                activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
            } else {
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            
            if let popoverController = activityController.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath){
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                }
            }
            self.present(activityController, animated: true, completion: nil)
        }
        deleteAction.backgroundColor = UIColor.systemRed
        deleteAction.image = UIImage(systemName: "trash")
        shareAction.backgroundColor = UIColor.systemOrange
        shareAction.image = UIImage(systemName: "square.and.arrow.up")
        // Configure both actions as swipe action
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        return swipeConfiguration
    }

    // MARK: leadingSwipeActionsConfigurationForRowAt function
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // Disable while in search mode
        if searchController.isActive {
            return UISwipeActionsConfiguration()
        }
        
        let favoriteAction = UIContextualAction(style: .normal, title: nil){ (action, sourceView, completionHandler) in
            let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
            cell.heartImage.isHidden = self.restaurants[indexPath.row].isFavorite
            self.restaurants[indexPath.row].isFavorite = self.restaurants[indexPath.row].isFavorite ? false : true
            if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
                appDelegate.saveContext()
            }
            completionHandler(true)
        }
        favoriteAction.backgroundColor = UIColor.systemYellow
        let favoriteActionName = restaurants[indexPath.row].isFavorite ? "heart.slash.fill" : "heart.fill"
        favoriteAction.image = UIImage(systemName: favoriteActionName)
        let swipeConfiguration = UISwipeActionsConfiguration(actions:[favoriteAction])
        return swipeConfiguration
    }
    
    // MARK: Navigation - prepare for segue: UIStoryboardSegue function
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! RestaurantDetailViewController
                destinationController.restaurant = self.restaurants[indexPath.row]
//                destinationController.restaurantImageName = self.restaurants[indexPath.row].image
//                destinationController.detailNameText = self.restaurants[indexPath.row].name
//                destinationController.detailTypeText = self.restaurants[indexPath.row].type
//                destinationController.detailLocationText = self.restaurants[indexPath.row].location
            }
        }
    }
}

extension RestaurantTableViewController: NSFetchedResultsControllerDelegate{
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<any NSFetchRequestResult>) {
        updateSnapshot()
    }
}

extension RestaurantTableViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {
            return
        }
        
        fetchRestaurantData(searchText: searchText)
    }
}
