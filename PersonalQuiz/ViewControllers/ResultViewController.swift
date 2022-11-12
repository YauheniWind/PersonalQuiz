//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Vasichko Anna on 10.11.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var infomationAbouYouLabel: UILabel!
  
    private var counterDog = 0
    private var counterCat = 0
    private var counterRabbit = 0
    private var counterTurtel = 0
  
//    var currentAnimal: [Answer] = []
//    var resultAnswers: [Answer] = []
    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
//      findResult()
//      findAnimal()
      personalResult()
    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          self.navigationItem.hidesBackButton = true
    }
  
    private func personalResult() {
      var placeForSaveResult: [Animal: Int] = [:]
      let responsesType = responses.map{$0.animal}
      
      for respons in responsesType {
        placeForSaveResult[respons] = (placeForSaveResult[respons] ?? 0) + 1
      }
      
      let answerSorted  = placeForSaveResult.sorted(by: {
        (pair1, pair2) -> Bool in
        return pair1.value > pair2.value
      })
      
      
      guard let commonAnswer = answerSorted.first?.key else { return }
      
      animalLabel.text = String(commonAnswer.rawValue)
      infomationAbouYouLabel.text = commonAnswer.definition
    }
      
//    First version

//    private func findResult() {
//      for answer in resultAnswers {
//        if answer.animal == .dog {
//          counterDog += 1
//        } else if answer.animal == .cat {
//          counterCat += 1
//        } else if answer.animal == .rabbit {
//          counterRabbit += 1
//        } else if answer.animal == .turtle{
//          counterTurtel += 1
//        }
//      }
//    }
      
//    private func findAnimal() {
//
//      for animal in currentAnimal {
//
//        if counterDog > counterCat && counterDog > counterRabbit && counterDog > counterTurtel {
//          if animal.animal == .dog {
//            animalLabel.text = animal.title
//            infomationAbouYouLabel.text = animal.animal.definition
//          }
//        } else if counterCat > counterDog && counterCat > counterRabbit && counterCat > counterTurtel {
//          if animal.animal == .cat {
//            animalLabel.text = animal.title
//            infomationAbouYouLabel.text = animal.animal.definition
//          }
//        } else if counterRabbit > counterDog && counterRabbit > counterCat && counterRabbit > counterTurtel {
//          if animal.animal == .rabbit {
//            animalLabel.text = animal.title
//            infomationAbouYouLabel.text = animal.animal.definition
//          }
//        } else {
//          if animal.animal == .turtle {
//            animalLabel.text = animal.title
//            infomationAbouYouLabel.text = animal.animal.definition
//          }
//        }
//      }
//
//    }

    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
}
