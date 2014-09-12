// Playground - noun: a place where people can play

import Cocoa

// BEGIN product_class
class Product : NSObject {
    
    var productName : String?
    var price : Float?
    var stockCode : String?
    var numberInStock : Int?
    
}
// END product_class

extension Product {
    
    /*
    // BEGIN creating_product_with_dict
    convenience init(dictionary: [String : AnyObject]) {
        
        self.init()
        
        if let productName: AnyObject = dictionary["productName"] {
            self.productName = productName as? String;
        }
        
        if let price: AnyObject = dictionary["price"] {
            self.price = price as? Float;
        }
        
        if let stockCode: AnyObject = dictionary["productName"] {
            self.stockCode = stockCode as? String;
        }
        
        if let numberInStock: AnyObject = dictionary["productName"] {
            self.numberInStock = numberInStock as? Int;
        }
        
        
    }
    // END creating_product_with_dict
    */
    
    // BEGIN creating_product_with_dict_v2
    convenience init(dictionary: [String : AnyObject]) {
        self.init()
        for (key, value) in dictionary {
            println("\(key) : \(value)")
            self.setValue(value, forKey: key)
        }
    }
    // END creating_product_with_dict_v2

}

var product = Product(dictionary: [
    "productName":"Widget",
    //"price": 4.99,
    "stockCode": "A1",
    //"numberInStock": 1
])


product.productName

