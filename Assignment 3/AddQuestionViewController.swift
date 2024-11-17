//
//  AddQuestionViewController.swift
//  Assignment 3
//
//  Created by Aniket Saxena on 2024-11-16.
//

import UIKit

protocol QuestionDelegate: AnyObject {
    func didAddQuestion(_ question: Question)
}

class AddQuestionViewController: UIViewController {

    weak var delegate: QuestionDelegate?

    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var correctAnswerField: UITextField!
    @IBOutlet var incorrectAnswerFields: [UITextField]!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Question"
    }

    @IBAction func saveQuestion(_ sender: UIButton) {
        guard let text = questionTextField.text,
              let correctAnswer = correctAnswerField.text,
              !text.isEmpty, !correctAnswer.isEmpty else { return }

        let incorrectAnswers = incorrectAnswerFields.compactMap { $0.text }
        let question = Question(text: text, correctAnswer: correctAnswer, incorrectAnswers: incorrectAnswers)

        delegate?.didAddQuestion(question)
        navigationController?.popViewController(animated: true)
    }

    @IBAction func cancel(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
