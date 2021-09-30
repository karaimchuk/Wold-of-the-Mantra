//
//  QuestionsTableViewCell.swift
//  Mantra
//
//  Created by Karaimchuk on 21.09.21.
//

import UIKit

class QuestionsTableViewCell: UITableViewCell {
  @IBOutlet weak public var questionLabel: UILabel!
  @IBOutlet weak public var answerLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    answerLabel.textColor = UIColor(red: 138.0 / 255.0, green: 138.0 / 255.0, blue: 143.0 / 255.0, alpha: 1.0)
  }
  
  override var reuseIdentifier: String? {
    return "QuestionsTableViewCell"
  }
  
  public func configureCellElements(questionsArr: String, answersArr: String) {
    questionLabel.text = questionsArr
    answerLabel.text = answersArr
  }
  
}
