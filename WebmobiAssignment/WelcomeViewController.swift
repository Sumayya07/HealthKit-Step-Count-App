//
//  WelcomeViewController.swift
//  WebmobiAssignment
//
//  Created by Sumayya Siddiqui on 04/06/23.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var viewContainer: UIView!
    @IBOutlet var imgLogo: UIImageView!
    @IBOutlet var btnClick: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = ""
        viewContainer.layer.cornerRadius = 20
        imgLogo.layer.cornerRadius = 8
        btnClick.layer.cornerRadius = 8

    }
    
    @IBAction func btnClickTapped(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
}
