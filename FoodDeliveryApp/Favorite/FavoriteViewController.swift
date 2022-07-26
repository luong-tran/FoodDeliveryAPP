//
//  FavoriteViewController.swift
//  FoodDeliveryApp
//
//  Created by LuongTran on 24/07/2022.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    @IBOutlet weak var tvFavorite: UITableView!
    
    let cellName = String(describing: CartTableViewCell.self)
    
    var nameCartArr = ["SR Home Food", "Cheese Burger", "Cheese Pizza", "SR Home Food"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configNavigationFavorite()
        configTableView()
    }

    func configNavigationFavorite(){
        self.title = "Favorite"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.red]
    }
    
    func configTableView(){
        let nib = UINib(nibName: cellName, bundle: nil)
        tvFavorite.register(nib, forCellReuseIdentifier: cellName)
        tvFavorite.dataSource = self
        tvFavorite.delegate = self
    }

}

extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameCartArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName) as! CartTableViewCell
        cell.lblNameFood.text = "\(nameCartArr[indexPath.row])"
        cell.lblPriceFood.text = "15.00 $"
        cell.lblQuantity.isHidden = true
        cell.btnFavorite.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        cell.btnFavorite.tintColor = .red
        cell.btnFavorite.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        return cell
    }
    
    @objc func handleRegister(_ sender: UIButton){
        let point = sender.convert(CGPoint.zero, to: tvFavorite)
        guard let indexpath = tvFavorite.indexPathForRow(at: point) else {return}
        nameCartArr.remove(at: indexpath.row)
        tvFavorite.beginUpdates()
        tvFavorite.deleteRows(at: [IndexPath(row: indexpath.row, section: 0)], with: .left)
        tvFavorite.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//        // delete
//        let delete = UIContextualAction(style: .normal, title: "Delete") { (action, view, completionHandler) in
//            self.tvFavorite.beginUpdates()
//            self.nameCartArr.remove(at: indexPath.row)
//            self.tvFavorite.deleteRows(at: [indexPath], with: .fade)
//            self.tvFavorite.endUpdates()
//            completionHandler(true)
//        }
//        delete.backgroundColor = .red
//
//        // swipe
//        let swipe = UISwipeActionsConfiguration(actions: [delete])
//
//        return swipe
//
//    }
}
