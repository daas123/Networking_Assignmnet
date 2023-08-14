//
//  InitialVC.swift
//  Networking_Assignmnet
//
//  Created by Neosoft on 11/08/23.
//

import UIKit

class InitialVC: UIViewController {
    @IBOutlet var tabelview: UITableView!
    let viewmodel = ProductViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelview.delegate = self
        tabelview.dataSource = self
        viewmodel.fetchProducts { result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self.tabelview.reloadData()
                case .failure(let error):
                    self.showErrorAlert(error.localizedDescription)
                }
            }
        }
        
    }

    func showErrorAlert(_ error : String){
        let alertcontroller = UIAlertController(title: "Error", message: error , preferredStyle: .alert)
        alertcontroller.addAction(UIAlertAction(title: "ok", style: .cancel))
        self.present(alertcontroller, animated: true, completion: nil)
    }
    
}

extension InitialVC :  UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewmodel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FirstTableViewCell
        cell.cellProductTitle.text = viewmodel.products[indexPath.row].name
        cell.cellprice.text = String(viewmodel.products[indexPath.row].cost)
        cell.cellproducer.text = viewmodel.products[indexPath.row].producer
        viewmodel.getImagesForProduct(at: indexPath.row) { image in
                    DispatchQueue.main.async {
                        cell.cellImage.image = image ?? UIImage(named: "placeholder")
                    }
                }

        return cell
    }
    
    
}
