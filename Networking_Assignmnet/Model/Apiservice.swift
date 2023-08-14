//
//  productdetails.swift
//  Networking_Assignmnet
//
//  Created by Neosoft on 11/08/23.
//
import UIKit
import Foundation

class getdata{
    static let apishare =  getdata()
    func getDataFromApi(completion : @escaping(Result<product,Error>)->()){
        let task = URLSession.shared.dataTask(with: URL(string: "http://staging.php-dev.in:8844/trainingapp/api/products/getList?product_category_id=1")!){
            (data, responce , erorr) in
            if erorr == nil{
                if (responce as! HTTPURLResponse).statusCode <= 300{
                    guard let jsondata = try? JSONDecoder().decode(product.self, from: data!) else {return}
                    completion(.success(jsondata))
                }
            }
            else {
                completion(.failure(erorr!))
            }
            
        }.resume()
    }
    
    func loadImage(from imageUrl: String, completion: @escaping (UIImage?) -> Void) {
            guard let url = URL(string: imageUrl) else {
                completion(nil)
                return
            }
            
            let imageTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error loading image: \(error)")
                    completion(nil)
                    return
                }
                
                if let data = data, let image = UIImage(data: data) {
                    completion(image)
                } else {
                    completion(nil)
                }
            }
            imageTask.resume()
        }
    
    
}

