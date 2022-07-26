//
//  AlertCustomViewController.swift
//  FoodDeliveryApp
//
//  Created by LuongTran on 26/07/2022.
//

import UIKit

protocol CustomAlertDelegate{
    func okButtonTapped(title: String, message: String)
    func cancelButtonTapped()
}

class AlertCustomViewController: UIViewController {

    @IBOutlet var parentView: UIView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var groupBtnView: UIView!
    @IBOutlet weak var lblAlertMessage: UILabel!
    @IBOutlet weak var lblAlertTitle: UILabel!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnOk: UIButton!
    
//    let alertViewGrayColor
    var delegate :CustomAlertDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpView()
        animateView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layoutIfNeeded()
    }
    
    func setUpView(){
        alertView.layer.cornerRadius = 10
        roundCorners()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }

    func roundCorners() {
        let rectShape = CAShapeLayer()
        rectShape.bounds = self.groupBtnView.frame
        rectShape.position = self.groupBtnView.center
        rectShape.path = UIBezierPath(roundedRect: self.groupBtnView.bounds, byRoundingCorners: [.bottomLeft , .bottomRight], cornerRadii: CGSize(width: 10, height: 10)).cgPath
        self.groupBtnView.layer.mask = rectShape
    }
    
    func animateView(){
        alertView.alpha = 0
        self.alertView.frame.origin.y = self.alertView.frame.origin.y + 0
        UIView.animate(withDuration: 0.0, animations: {() -> Void in
            self.alertView.alpha = 1.0
            self.alertView.frame.origin.y = self.alertView.frame.origin.y - 0
        })
    }
    
    @IBAction func btnCancelTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnOkTapped(_ sender: Any) {
        delegate?.okButtonTapped(title: lblAlertTitle.text!, message: lblAlertMessage.text!)
    }
}
