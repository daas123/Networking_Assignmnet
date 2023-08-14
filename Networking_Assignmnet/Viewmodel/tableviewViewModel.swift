//
//  tableviewViewModel.swift
//  Networking_Assignmnet
//
//  Created by Neosoft on 11/08/23.
//

import Foundation
import UIKit

class ProductViewModel {
    let alertcontroller = UIAlertController(title: "error", message: "data wouden't be able to fetch", preferredStyle: .alert)
    var products: [productlist] = []
    
    // this function will get the value from api and set it on products
    func fetchProducts(completion: @escaping(Result<Void, Error>) -> Void) {
//        DispatchQueue.global().async {
            getdata.apishare.getDataFromApi { result in
                switch result {
                case .success(let product):
                    self.products = product.data
                    completion(.success(()))

                case .failure(let error):
                    print("Error fetching products: \(error)")
                    completion(.failure(error))
                default :print("error")
                }
            }
    }
    
    func getImagesForProduct(at index: Int, completion: @escaping (UIImage?) -> Void) {
            let product = products[index]
            getdata.apishare.loadImage(from: product.product_images) { image in
                completion(image)
            }
        }

}





