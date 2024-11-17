//
//  ResultViewController.swift
//  Assignment 3
//
//  Created by Aniket Saxena on 2024-11-16.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!

    var score: Int = 0
    var totalQuestions: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "Your Score: \(score)/\(totalQuestions)"
    }
}
