//
//  productdetails.swift
//  Networking_Assignmnet
//
//  Created by Neosoft on 11/08/23.
//

import Foundation

class getdata{
    static let apishare =  getdata()
    func getDataFromApi(completion : @escaping(Result<product,Error>)->()){
        let task = URLSession.shared.dataTask(with: URL(string: "http://staging.php-dev.in:8844/trainingapp/api/products/getList?product_category_id=1")!){
            (data, responce , erorr) in
            if erorr == nil{
                guard let jsondata = try? JSONDecoder().decode(product.self, from: data!) else {return}
                completion(.success(jsondata))
            }
            
        }.resume()
        
    }
}
