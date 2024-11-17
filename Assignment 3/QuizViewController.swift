//
//  QuizViewController.swift
//  Assignment 3
//
//  Created by Aniket Saxena on 2024-11-16.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet weak var progressBar: UIProgressView!

    var questions: [Question] = []
    var currentQuestionIndex = 0
    var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestion()
    }

    func loadQuestion() {
        guard currentQuestionIndex < questions.count else {
            showResult()
            return
        }

        let question = questions[currentQuestionIndex]
        questionLabel.text = question.text
        var answers = question.incorrectAnswers
        answers.append(question.correctAnswer)
        answers.shuffle()

        for (index, button) in answerButtons.enumerated() {
            button.setTitle(answers[index], for: .normal)
        }
    }

    @IBAction func answerSelected(_ sender: UIButton) {
        guard let answer = sender.title(for: .normal) else { return }
        if answer == questions[currentQuestionIndex].correctAnswer {
            score += 1
        }
        currentQuestionIndex += 1
        loadQuestion()
    }

    func showResult() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let resultVC = storyboard.instantiateViewController(withIdentifier: "ResultVC") as? ResultViewController {
            resultVC.score = score
            resultVC.totalQuestions = questions.count
            navigationController?.pushViewController(resultVC, animated: true)
        }
    }
}
