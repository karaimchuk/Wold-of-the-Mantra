//
//  QuestionsViewController.swift
//  Mantra
//
//  Created by Karaimchuk on 21.09.21.
//

import UIKit

class QuestionsViewController: UIViewController {
  @IBOutlet weak private var questionsTableView: UITableView!
  private let questionsModel = QuestionsModel()
  private var selectedIndex = -1
  private var isColabsable = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 231.0 / 255.0, green: 246.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
    
    let nib = "QuestionsTableViewCell"
    questionsTableView.register(UINib(nibName: nib, bundle: nil), forCellReuseIdentifier: "QuestionsTableViewCell")
    questionsTableView.delegate = self
    questionsTableView.dataSource = self
    questionsTableView.backgroundColor = .clear
    
    questionsTableView.estimatedRowHeight = 180
    questionsTableView.rowHeight = UITableView.automaticDimension
    
    setupNavigationBar()
  }
  
  private func setupNavigationBar() {
    self.navigationItem.title = "Questions"
    self.navigationController?.navigationBar.prefersLargeTitles = true
  }
  
}

extension QuestionsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    questionsTableView.deselectRow(at: indexPath, animated: true)
    
    if selectedIndex == indexPath.row {
      if self.isColabsable == false {
        self.isColabsable = true
      } else {
        self.isColabsable = false
      }
    } else {
      self.isColabsable = true
    }
    self.selectedIndex = indexPath.row
    questionsTableView.beginUpdates()
    questionsTableView.endUpdates()
  }
  
}

extension QuestionsViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return questionsModel.questionArr.count
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if selectedIndex == indexPath.row && isColabsable == true {
      return 180
    } else {
      return 56
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let questionCell = tableView.dequeueReusableCell(withIdentifier: "QuestionsTableViewCell") as! QuestionsTableViewCell
    
    questionCell.backgroundColor = .clear
    questionCell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
    
    questionCell.configureCellElements(questionsArr: questionsModel.questionArr[indexPath.row], answersArr: questionsModel.answerArr[indexPath.row])
    
    return questionCell
  }
  
}
