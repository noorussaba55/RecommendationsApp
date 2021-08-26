//
//  QuestionViewController.swift
//  RecommendationsApp
//
//  Created by Noor-us-saba Karim on 26/8/21.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet var questionTextLabel: UILabel!
    
    @IBOutlet var answerButtons: [UIButton]!
    
    var currentQuestion: Question?
    var currentQuestionsArray = questionsArray
    var finalEateryResult: Eatery?
    var recommendationType: EateryPreference?
    var possibleRecommendationsArrayForPreferredType: [Eatery]=[]
    var userResponsesArray: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateArrayOfEateries()
        nextQuestion()
        
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        print(sender.tag)
        let response = (currentQuestion?.answers[sender.tag])!
        userResponsesArray.append(response)
        nextQuestion()
    }
    
    
    func populateArrayOfEateries(){
        for eatery in availableEateriesToRecommend{
            if eatery.type == recommendationType{
                possibleRecommendationsArrayForPreferredType.append(eatery)
            }
        }
    }
    
    func nextQuestion(){
        
        if currentQuestionsArray.count > 0 {
            currentQuestion = currentQuestionsArray.removeFirst()
            updateUI()
        }
        else{
            findResultsFromResponses()
            performSegue(withIdentifier: "showRecommendations", sender: self)
        }
    }
    
    func updateUI() {
        
        if currentQuestion != nil{
            questionTextLabel.text = currentQuestion?.text
            
            var i=0
            for button in answerButtons {
               let answerTitle = currentQuestion?.answers[i].text
                button.setTitle(answerTitle, for: .normal)
                button.tag = i
                i += 1
            }
            
        }
    }
    
    func findResultsFromResponses(){
        
        print(userResponsesArray)
        
        let frequencyOfAnswers = userResponsesArray.reduce(into: [:]) {
            (counts, answer) in counts[answer.type, default: 0] += 1
        }
        
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by:
        { (pair1, pair2) in
            return pair1.value > pair2.value
        })
        
        let mostCommonAnswer = frequentAnswersSorted.first!.key
        
        for eatery in possibleRecommendationsArrayForPreferredType{
            if eatery.category == mostCommonAnswer{
                finalEateryResult = eatery
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showRecommendations":
            do {
                let destinationVC = segue.destination as? ResultViewController
                destinationVC?.recommendedEatery = self.finalEateryResult
            }
        
        default:
            break
        }
        
    }

}
