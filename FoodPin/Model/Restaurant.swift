//
//  Restaurant.swift
//  FoodPin
//
//  Created by Myung Woo on 7/12/24.
//

import Foundation
//
//struct Restaurant: Hashable {
//    enum Rating: String {
//        case awesome
//        case good
//        case okay
//        case bad
//        case terrible
//        
//        var image: String {
//            switch self {
//            case .awesome: return "love"
//            case .good: return "cool"
//            case .okay: return "happy"
//            case .bad: return "sad"
//            case .terrible: return "angry"
//            }
//        }
//    }
//    var name: String
//    var type: String
//    var location: String
//    var image: String
//    var phone: String
//    var description: String
//    var isFavorite: Bool
//    var rating: Rating
//    
//    init(name: String, type: String, location: String, phone: String, description: String, image: String, isFavorite: Bool, rating: Rating){
//        self.name = name
//        self.type = type
//        self.location = location
//        self.image = image
//        self.phone = phone
//        self.description = description
//        self.isFavorite = isFavorite
//        self.rating = rating
//    }
//    
//    init(){
//        self.init(name: "", type: "", location: "", phone: "", description: "", image:"", isFavorite: false, rating: .awesome)
//    }
//}

import CoreData

public class Restaurant: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Restaurant> {
        return NSFetchRequest<Restaurant>(entityName: "Restaurant")
    }
    
    @NSManaged public var name: String
    @NSManaged public var type: String
    @NSManaged public var location: String
    @NSManaged public var phone: String
    @NSManaged public var summary: String
    @NSManaged public var image: Data
    @NSManaged public var ratingText: String?
    @NSManaged public var isFavorite: Bool
    
}

extension Restaurant {
    enum Rating: String {
        case awesome
        case good
        case okay
        case bad
        case terrible
        
        var image: String {
            switch self {
            case .awesome: return "love"
            case .good: return "cool"
            case .okay: return "happy"
            case .bad: return "sad"
            case .terrible: return "angry"
            }
        }
    }
    
    var rating: Rating? {
        get {
            guard let ratingText = ratingText else {
                return nil
            }
            
            return Rating(rawValue: ratingText)
        }
        set {
            self.ratingText = newValue?.rawValue
        }
    }
}
