//
//  QuestionsAndAnswers.swift
//  RecommendationsApp
//
//  Created by Noor-us-saba Karim on 26/8/21.
//

import Foundation

struct Question {
    var text: String
    var answers: [Answer]
}

struct Answer {
    var text: String
    var type: EateryCategory
}

struct Eatery {
    
    var name: String
    var address: String
    var type: EateryPreference
    var category :EateryCategory
    
    var brief: String{
        switch self.category {
        
        case .fastfood:
            return "\(self.name) is affordable, nearby and open all day"
        
        case .average:
            return "\(self.name) is affordable, not too far and open in the afternoons"
        
        case .fine:
            return "\(self.name) is expensive, at a drive and open in the evenings only"
        
        }
    }
    
}

enum EateryCategory {
    
    case fastfood, average, fine


}

enum EateryPreference{
    case food, drink
}


var availableEateriesToRecommend: [Eatery] = [
    
    Eatery(name: "Fish n chips", address: "3 good street, thompar", type: .food, category: .fastfood),
    Eatery(name: "Tim's kitchen", address: "14 timmm street, ryde", type: .food, category: .average),
    Eatery(name: "fusion", address: "6A boulevard road, orange", type: .food, category: .fine),
    
    Eatery(name: "drink up!", address: "9/35 queen street, praline", type: .drink, category: .fastfood),
    Eatery(name: "kopikola", address: "23 blue avenue, triko", type: .drink, category: .average),
    Eatery(name: "Rose's club", address: "3c kurtis street, kolyer", type: .drink, category: .fine),
]

var questionsArray: [Question] = [

    Question(text: "What time best suits you?", answers: [
                Answer(text: "All day", type: .fastfood),
                Answer(text: "Afternoon", type: .average),
                Answer(text: "evening", type: .fine)]
    ),
    Question(text: "What price range are you looking for?", answers: [
                Answer(text: "<$30", type: .fastfood),
                Answer(text: "$30-$50", type: .average),
                Answer(text: ">$50", type: .fine)]
    ),
    Question(text: "What's your preferred location?", answers: [
                Answer(text: "< 5 KM", type: .fastfood),
                Answer(text: "5 - 10 KM", type: .average),
                Answer(text: "> 10 KM", type: .fine)]
    ),
    Question(text: "What best suits you?", answers: [
                Answer(text: "Take away", type: .fastfood),
                Answer(text: "Walk-In", type: .average),
                Answer(text: "Reservation", type: .fine)]
    )
]
