//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Thai Minh on 27/01/2021.
//

import UIKit

class QuestionViewController: UIViewController {
  var questions: [Question] = [
    Question(
      text: "Which food do you like the most?",
      type: .single,
      answers: [
        Answer(text: "Steak", type: .dog),
        Answer(text: "Fish", type: .dolphin),
        Answer(text: "Carrots", type: .fox),
        Answer(text: "Insects", type: .frog)
      ]
    ),
    Question(
      text: "Which activities do you enjoy?",
      type: .multiple,
      answers: [
        Answer(text: "Swimming", type: .dolphin),
        Answer(text: "Sleeping", type: .dog),
        Answer(text: "Cuddling", type: .fox),
        Answer(text: "Eating", type: .frog)
      ]
    ),
    Question(
      text: "How much do you enjoy car rides?",
      type: .ranged,
      answers: [
        Answer(text: "I dislike them", type: .dolphin),
        Answer(text: "I get a little nervous", type: .frog),
        Answer(text: "I barely notice them", type: .fox),
        Answer(text: "I love them", type: .dog)
      ]
    )
  ]
  
  var questionIndex = 0
  var answersChosen: [Answer] = []
  
  @IBOutlet var questionLabel: UILabel!
  
  @IBOutlet var singleStackView: UIStackView!
  @IBOutlet var singleButton1: UIButton!
  @IBOutlet var singleButton2: UIButton!
  @IBOutlet var singleButton3: UIButton!
  @IBOutlet var singleButton4: UIButton!
  
  @IBOutlet var multiStackView: UIStackView!
  @IBOutlet var multiLabel1: UILabel!
  @IBOutlet var multiLabel2: UILabel!
  @IBOutlet var multiLabel3: UILabel!
  @IBOutlet var multiLabel4: UILabel!
  
  @IBOutlet var rangeStackView: UIStackView!
  @IBOutlet var rangedLabel1: UILabel!
  @IBOutlet var rangedLabel2: UILabel!
  
  @IBOutlet var questionProgressView: UIProgressView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    updateUI()
  }
  
  func updateUI() {
    // hide all answer stack views
    singleStackView.isHidden = true
    multiStackView.isHidden = true
    rangeStackView.isHidden = true
    
    // set a suitable question title
    navigationItem.title = "Question #\(questionIndex + 1)"
    
    // choose the next question
    let curQuestion = questions[questionIndex]
    let currentAnswers = curQuestion.answers
    let totalProgress = Float(questionIndex) / Float(questions.count)
    questionLabel.text = curQuestion.text
    questionProgressView.setProgress(totalProgress, animated: true)
    
    // show the correct answer type
    switch curQuestion.type {
    case .single:
      updateSingleStack(using: currentAnswers)
    case .multiple:
      updateMultipleStack(using: currentAnswers)
    case .ranged:
      updateRangedStack(using: currentAnswers)
    }
  }
  
  func updateSingleStack(using answers: [Answer]) {
    singleStackView.isHidden = false
    singleButton1.setTitle(answers[0].text, for: .normal)
    singleButton2.setTitle(answers[1].text, for: .normal)
    singleButton3.setTitle(answers[2].text, for: .normal)
    singleButton4.setTitle(answers[3].text, for: .normal)
  }
  
  func updateMultipleStack(using answers: [Answer]) {
    multiStackView.isHidden = false
    multiLabel1.text = answers[0].text
    multiLabel2.text = answers[1].text
    multiLabel3.text = answers[2].text
    multiLabel4.text = answers[3].text
  }
  
  func updateRangedStack(using answers: [Answer]) {
    rangeStackView.isHidden = false
    rangedLabel1.text = answers.first?.text
    rangedLabel2.text = answers.last?.text
  }
  
  func nextQuestion() {
    
  }
  
  @IBAction func singleAnswerBtnPressed(_ sender: UIButton) {
    let currentAnswers = questions[questionIndex].answers
    
    switch sender {
    case singleButton1:
      answersChosen.append(currentAnswers[0])
    case singleButton2:
      answersChosen.append(currentAnswers[1])
    case singleButton3:
      answersChosen.append(currentAnswers[2])
    case singleButton4:
      answersChosen.append(currentAnswers[3])
    default:
      break
    }
    
    nextQuestion()
  }
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
