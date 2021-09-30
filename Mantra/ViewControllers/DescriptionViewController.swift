//
//  DescriptionViewController.swift
//  Mantra
//
//  Created by Karaimchuk on 24.09.21.
//

import UIKit

class DescriptionViewController: UIViewController {
  @IBOutlet weak private var mantraImage: UIImageView!
  @IBOutlet weak private var mantraText: UITextView!
  
  public var mantraTextArr = ""
  public var mantraImageArr = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 231.0 / 255.0, green: 246.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
    
    mantraText.text = mantraTextArr
    mantraImage.image = UIImage(named: mantraImageArr)
    
    setupNavigationBar()
  }
  
  private func setupNavigationBar() {
    self.navigationController?.navigationBar.tintColor = .red
  }
}
