//
//  CartTableViewCell.swift
//  FoodDeliveryApp
//
//  Created by LuongTran on 25/07/2022.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var lblNameFood: UILabel!
    @IBOutlet weak var lblPriceFood: UILabel!
    @IBOutlet weak var lblQuantity: UILabel!
    @IBOutlet weak var btnFavorite: UIButton!
    
    var isFavorite = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        customStyle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func customStyle(){
        btnFavorite.tintColor = .black
    }
    
    @IBAction func changeStateFavorite(_ sender: Any) {
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
