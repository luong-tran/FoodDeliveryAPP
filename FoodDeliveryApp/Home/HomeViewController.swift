//
//  HomeViewController.swift
//  FoodDeliveryApp
//
//  Created by LuongTran on 24/07/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var clvImage: UICollectionView!
    @IBOutlet weak var clvFood: UICollectionView!
    @IBOutlet weak var clvLastOrder: UICollectionView!
    @IBOutlet weak var lblRestaurant: UILabel!
    @IBOutlet weak var lblLastOrder: UILabel!
    
    let imgArr = ["img1", "img1"]
    let imgFoodArr = ["food1", "food2", "food3", "food4"]
    let nameFoodArr = ["Cheese Burger", "Cheese Pizza", "Cheese Burger", "Cheese Pizza"]
    let priceFoodArr = ["15.00", "12.00", "20.00", "10.00"]
    
    let collName = String(describing: SliderCollectionViewCell.self)
    let collNameItem = String(describing: ItemFoodCollectionViewCell.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configNavigationHome()
        customStyle()
        configCollectionView()
    }


    func configNavigationHome(){
        self.navigationController?.navigationBar.topItem?.title = "Home"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.red]
        let changeStateButton = UIBarButtonItem(image: UIImage(systemName: "cart.fill"), landscapeImagePhone: nil, style: .done, target: self, action: #selector(cartScreen))
        changeStateButton.tintColor = .gray
        self.navigationItem.rightBarButtonItem = changeStateButton
    }
    
    @objc func cartScreen(){
        let cartViewController = CartViewController()
        cartViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(cartViewController, animated: true)
    }
    
    func customStyle(){
        lblRestaurant.layer.masksToBounds = true
        lblRestaurant.layer.cornerRadius = 10
        lblLastOrder.layer.masksToBounds = true
        lblLastOrder.layer.cornerRadius = 10
    }
    
    func configCollectionView(){
        let nib = UINib(nibName: collName, bundle: nil)
        clvImage.register(nib, forCellWithReuseIdentifier: collName)
        clvImage.layer.cornerRadius = 15
        clvImage.backgroundColor = .clear
        clvImage.dataSource = self
        clvImage.delegate = self
        
        let nibItem = UINib(nibName: collNameItem, bundle: nil)
        clvFood.register(nibItem, forCellWithReuseIdentifier: collNameItem)
        clvFood.backgroundColor = .clear
        clvFood.dataSource = self
        clvFood.delegate = self
        
        clvLastOrder.register(nibItem, forCellWithReuseIdentifier: collNameItem)
        clvLastOrder.backgroundColor = .clear
        clvLastOrder.dataSource = self
        clvLastOrder.delegate = self
    }

}


//Collection View
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.clvImage{
            return imgArr.count
        } else if collectionView == self.clvLastOrder{
            return imgFoodArr.count
        }
        return imgFoodArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.clvImage{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collName, for: indexPath) as! SliderCollectionViewCell
            cell.imgSlide.image = UIImage(named: "\(imgArr[indexPath.row])")
            return cell
        }else if collectionView == self.clvLastOrder{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collNameItem, for: indexPath) as! ItemFoodCollectionViewCell
            cell.imgFood.image = UIImage(named: "\(imgFoodArr[indexPath.row])")
            cell.lblNameFood.text = "\(nameFoodArr[indexPath.row])"
            cell.lblPriceFood.isHidden = true
            cell.btnAdd.isHidden = true
            cell.btnMinus.isHidden = true
            cell.lblCount.isHidden = true
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collNameItem, for: indexPath) as! ItemFoodCollectionViewCell
            cell.imgFood.image = UIImage(named: "\(imgFoodArr[indexPath.row])")
            cell.lblNameFood.text = "\(nameFoodArr[indexPath.row])"
            cell.lblPriceFood.text = "\(priceFoodArr[indexPath.row]) $"
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.clvImage{
            let size = clvImage.frame.size
            return CGSize(width: size.width, height: size.height)
        } else if collectionView == self.clvLastOrder{
            return CGSize(width: (clvFood.frame.size.width/2) - 3, height: 200)
        }
        return CGSize(width: (clvFood.frame.size.width/2) - 3, height: 280)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 0
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 0
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}

