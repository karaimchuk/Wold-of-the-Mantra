//
//  ViewController.swift
//  Mantra
//
//  Created by Karaimchuk on 19.09.21.
//

import UIKit

class MantrasViewController: UIViewController {
  
  @IBOutlet weak private var tableView: UITableView!
  private let mantrasModel = MantrasModel()
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor(red: 231.0 / 255.0, green: 246.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
    
    let nib = "MantraTableViewCell"
    tableView.register(UINib(nibName: nib, bundle: nil), forCellReuseIdentifier: "MantraTableViewCell")
    tableView.backgroundColor = .clear
    tableView.delegate = self
    tableView.dataSource = self
    
    setupNavigationBar()
  }
  
  private func setupNavigationBar() {
    self.navigationItem.title = "Mantras"
    self.navigationController?.navigationBar.prefersLargeTitles = true
  }
  
}

extension MantrasViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    let vc = storyboard.instantiateViewController(withIdentifier: "DescriptionViewController") as! DescriptionViewController
    vc.mantraTextArr = mantrasModel.mantraTextArr[indexPath.section]
    vc.mantraImageArr = mantrasModel.mantraImageArr[indexPath.section]
    navigationController?.pushViewController(vc, animated: true)
  }
  
}

extension MantrasViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let lessonsHeaderView = UIView()
    lessonsHeaderView.backgroundColor = .clear
    
    return lessonsHeaderView
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    if section == 0 {
      return 0
    }
    return 30
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return mantrasModel.mantraTitleArr.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let mantraCell = tableView.dequeueReusableCell(withIdentifier: "MantraTableViewCell") as! MantraTableViewCell
    
    mantraCell.clipsToBounds = true
    mantraCell.layer.cornerRadius = 10
    mantraCell.layer.borderWidth = 1
    mantraCell.layer.borderColor = UIColor.lightGray.cgColor
        
    mantraCell.configureCellElements(mantraImageArr: mantrasModel.mantraImageArr[indexPath.section], mantraTitleTextArr: mantrasModel.mantraTitleArr[indexPath.section])
    
    return mantraCell
  }
  
}
