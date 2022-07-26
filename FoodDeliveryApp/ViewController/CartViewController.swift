//
//  CartViewController.swift
//  FoodDeliveryApp
//
//  Created by LuongTran on 25/07/2022.
//

import UIKit

class CartViewController: UIViewController {
    @IBOutlet weak var tvCart: UITableView!
    
    var nameCartArr = ["SR Home Food", "Cheese Burger", "Cheese Pizza", "SR Home Food"]
    let quantityCartArr = ["x2", "x2", "x1", "x2"]
    
    let cellName = String(describing: CartTableViewCell.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configNavigationCart()
        configTableView()
    }

    func configNavigationCart(){
        self.title = "Cart"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.red]
        self.navigationController?.navigationBar.tintColor = .black
        
        //left bar
        let barbuttomItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem = barbuttomItem
        
        //right bar
        let moreButton = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 28))
        moreButton.backgroundColor = .red
        moreButton.setTitle("Order", for: .normal)
        moreButton.layer.cornerRadius = 15
        moreButton.addTarget(self, action: #selector(orderTarget), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: moreButton)
    }
    
    func configTableView(){
        let nib = UINib(nibName: cellName, bundle: nil)
        tvCart.register(nib, forCellReuseIdentifier: cellName)
        tvCart.dataSource = self
        tvCart.delegate = self
    }
    
    @objc func orderTarget(){
        let alertCustomVC = AlertCustomViewController()
        alertCustomVC.delegate = self
        alertCustomVC.modalPresentationStyle = .overCurrentContext
        alertCustomVC.providesPresentationContextTransitionStyle = true
        alertCustomVC.definesPresentationContext = true
        alertCustomVC.modalTransitionStyle = .crossDissolve
        self.present(alertCustomVC, animated: true)
    }
    
    @objc func back(){
//        self.hidesBottomBarWhenPushed = false
        navigationController?.popViewController(animated: true)
    }


}
extension CartViewController: CustomAlertDelegate{
    func cancelButtonTapped() {
        
    }
    
    func okButtonTapped(title: String, message: String) {
        print(title)
        print(message)
    }
    
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameCartArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName) as! CartTableViewCell
        cell.lblNameFood.text = "\(nameCartArr[indexPath.row])"
        cell.lblQuantity.text = "\(quantityCartArr[indexPath.row])"
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            
        // delete
        let delete = UIContextualAction(style: .normal, title: "Delete") { (action, view, completionHandler) in
            self.tvCart.beginUpdates()
            self.nameCartArr.remove(at: indexPath.row)
            self.tvCart.deleteRows(at: [indexPath], with: .fade)
            self.tvCart.endUpdates()
            completionHandler(true)
        }
        delete.backgroundColor = .red
        
        // swipe
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        
        return swipe
        
    }
}
