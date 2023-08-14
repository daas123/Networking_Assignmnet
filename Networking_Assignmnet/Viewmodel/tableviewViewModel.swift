//
//  tableviewViewModel.swift
//  Networking_Assignmnet
//
//  Created by Neosoft on 11/08/23.
//

import Foundation
import UIKit
class ProductViewModel {
    var products: [productlist] = []
    
    // this function will get the value from api and set it on products
    func fetchProducts(completion: @escaping () -> Void) {
//        DispatchQueue.global().async {
            getdata.apishare.getDataFromApi { result in
                switch result {
                case .success(let product):
                    self.products = product.data
                    DispatchQueue.main.async
                    {
                        completion()
                    }
                case .failure(let error):
                    print("Error fetching products: \(error)")
                    DispatchQueue.main.async
                    {
                        completion()
                    }
                default :print("error")
                }
            }
    }
    func getimages(_ imagepath:String, completion: @escaping (UIImage?) -> Void) {
        let imageurl = URL(string: imagepath )
        let imagetask = URLSession.shared.dataTask(with: imageurl!) { (data, response, error) in
            if error == nil, (response as! HTTPURLResponse).statusCode == 200 {
                if let data = data {
                    
                    completion(UIImage(data: data))
                }
            }
        }
        imagetask.resume()
    }
    func getImagesForProduct(at index: Int, completion: @escaping (UIImage?) -> Void) {
            let product = products[index]
            getimages(product.product_images) { image in
                completion(image)
            }
        }
//    func getImagesForProduct(at index: Int, completion: @escaping (UIImage?) -> Void) {
//            let product = products[index]
//            getimages(product.product_images) { image in
//                completion(image)
//            }
//        }
//    
    

}





