//
//  RestaurantDiffableDataSource.swift
//  FoodPin
//
//  Created by Myung Woo on 7/12/24.
//

import UIKit

enum Section {
    case all
}



class RestaurantDiffableDataSource: UITableViewDiffableDataSource<Section, Restaurant> {

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
//         swipe to delete
//        if editingStyle == .delete {
//            if let restaurant = self.itemIdentifier(for: indexPath){
//                var snapshot = self.snapshot()
//                snapshot.deleteItems([restaurant])
//                self.apply(snapshot, animatingDifferences: true)
//            }
//        }
//        
//        
//        
//    }
    
    
    
}
