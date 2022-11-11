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
  
    var currentAnimal: [Answer] = []
    var resultAnswers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
      findResult()
      findAnimal()
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          self.navigationItem.hidesBackButton = true
    }
  
    private func findResult() {
      for answer in resultAnswers {
        if answer.animal == .dog {
          counterDog += 1
        } else if answer.animal == .cat {
          counterCat += 1
        } else if answer.animal == .rabbit {
          counterRabbit += 1
        } else if answer.animal == .turtle{
          counterTurtel += 1
          print(answer)
        }
      }
    }
  
    private func findAnimal() {
      
      for animal in currentAnimal {

        if counterDog > counterCat && counterDog > counterRabbit && counterDog > counterTurtel {
          if animal.animal == .dog {
            animalLabel.text = animal.title
            infomationAbouYouLabel.text = animal.animal.definition
          }
        } else if counterCat > counterDog && counterCat > counterRabbit && counterCat > counterTurtel {
          if animal.animal == .cat {
            animalLabel.text = animal.title
            infomationAbouYouLabel.text = animal.animal.definition
          }
        } else if counterRabbit > counterDog && counterRabbit > counterCat && counterRabbit > counterTurtel {
          if animal.animal == .rabbit {
            animalLabel.text = animal.title
            infomationAbouYouLabel.text = animal.animal.definition
          }
        } else {
          if animal.animal == .turtle {
            animalLabel.text = animal.title
            infomationAbouYouLabel.text = animal.animal.definition
          }
        }
      }
      
    }

    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
}
