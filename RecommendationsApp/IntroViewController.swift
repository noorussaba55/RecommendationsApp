//
//  ViewController.swift
//  RecommendationsApp
//
//  Created by Noor-us-saba Karim on 26/8/21.
//

import UIKit

class IntroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showFoodRecommendations":
            do {
                let destinationVC = segue.destination as? QuestionViewController
                destinationVC?.recommendationType = .food
            }
        case "showDrinksRecommendations":
                do {
                    let destinationVC = segue.destination as? QuestionViewController
                    destinationVC?.recommendationType = .drink
                }
        default:
            break
        }
    }

    @IBAction func unwindToIntroduction(segue:
    UIStoryboardSegue) {
        
    }
}

