//
//  ItemFoodCollectionViewCell.swift
//  FoodDeliveryApp
//
//  Created by LuongTran on 25/07/2022.
//

import UIKit

class ItemFoodCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var lblNameFood: UILabel!
    @IBOutlet weak var lblPriceFood: UILabel!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var btnFavorite: UIButton!
    
    var quantity: Int = 0
    var isFavorite = true
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        customStyle()
    }
    
    func customStyle(){
        btnAdd.tintColor = .black
        btnMinus.tintColor = .systemGray4
        btnFavorite.tintColor = .black
    }

    @IBAction func minusQuantity(_ sender: Any) {
        if quantity <= 1{
            quantity = 0
            lblCount.isHidden = true
        } else {
            quantity = quantity - 1
            lblCount.text = "\(quantity)"
        }
    }
    
    @IBAction func addQuantity(_ sender: Any) {
        lblCount.isHidden = false
        quantity = quantity + 1
        lblCount.text = "\(quantity)"
    }
    
    @IBAction func favoriteFood(_ sender: Any) {
        if(isFavorite){
            btnFavorite.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            btnFavorite.tintColor = .red
            isFavorite = false
        }else{
            btnFavorite.setImage(UIImage(systemName: "heart"), for: .normal)
            btnFavorite.tintColor = .black
            isFavorite = true
        }
    }
}
