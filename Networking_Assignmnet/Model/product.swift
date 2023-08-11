//
//  product.swift
//  Networking_Assignmnet
//
//  Created by Neosoft on 11/08/23.
//


// structure with respect to below data
//"status":200,"data":[{"id":1,"product_category_id":1,"name":"Centre Coffee Table","producer":"Luna","description":"Mild Steel Base In Poder Coated White Finish.8 mm Tempered Glass Table Top.Bottom Shelf In Paimted Brown Glass.","cost":5000,"rating":3,"view_count":30593,"created":"2015-09-07T09:24:05+0000","modified":"2023-08-10T08:09:26+0000","product_images":"http:\/\/staging.php-dev.in:8844\/trainingapp\/uploads\/prod_img\/thumb\/medium\/9dc6234da018916e545011fa1.jpeg"}

import Foundation

struct product:Decodable{
    var status : Int
    var data : [productlist]
}

struct productlist :Decodable{
    var name : String
    var producer : String
    var cost : Int
}
