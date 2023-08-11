//
//  tableviewViewModel.swift
//  Networking_Assignmnet
//
//  Created by Neosoft on 11/08/23.
//

import Foundation

class ProductViewModel {
    var products: [productlist] = []
    
    func fetchProducts(completion: @escaping () -> Void) {
        DispatchQueue.global().async {
            
            
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
    }
}





