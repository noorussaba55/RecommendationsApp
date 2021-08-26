//
//  ResultViewController.swift
//  RecommendationsApp
//
//  Created by Noor-us-saba Karim on 26/8/21.
//

import UIKit

class ResultViewController: UIViewController {
    
    var recommendedEatery: Eatery?

    @IBOutlet var nameTitleLabel: UILabel!
    @IBOutlet var addressTitleLabel: UILabel!
    @IBOutlet var briefTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateUI()
    }
    
    func updateUI(){
        
        guard let eatery = self.recommendedEatery else {
            return
        }
            
            nameTitleLabel.text = eatery.name
            addressTitleLabel.text = eatery.address
            briefTitleLabel.text = eatery.brief
        
    }
    
    


}
