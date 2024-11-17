//
//  QuestionListViewController.swift
//  Assignment 3
//
//  Created by Aniket Saxena on 2024-11-16.
//

import UIKit

class QuestionListViewController: UITableViewController {

    var questionBank: [Question] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Question Bank"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addQuestion))
    }

    @objc func addQuestion() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let addVC = storyboard.instantiateViewController(withIdentifier: "AddQuestionVC") as? AddQuestionViewController {
            addVC.delegate = self
            navigationController?.pushViewController(addVC, animated: true)
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionBank.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "QuestionCell")
        let question = questionBank[indexPath.row]
        cell.textLabel?.text = question.text
        return cell
    }
}

extension QuestionListViewController: QuestionDelegate {
    func didAddQuestion(_ question: Question) {
        questionBank.append(question)
        tableView.reloadData()
    }
}
