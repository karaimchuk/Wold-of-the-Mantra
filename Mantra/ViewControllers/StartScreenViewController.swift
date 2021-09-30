//
//  StartScreenViewController.swift
//  Mantra
//
//  Created by Karaimchuk on 22.09.21.
//

import UIKit

class StartScreenViewController: UIViewController {
  @IBOutlet weak private var startImageButton: UIButton!
  @IBOutlet weak private var startTextButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureStartTextButton()

    startTextButton.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
    startImageButton.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
  }
  
  @IBAction func didTapButton() {
    let vc = storyboard?.instantiateViewController(identifier: "MantraTabBar") as! UITabBarController
    vc.modalPresentationStyle = .fullScreen
    present(vc, animated: true, completion: nil)
  }
  
  private func configureStartTextButton() {
    startTextButton.layer.borderWidth = 1
    startTextButton.layer.cornerRadius = 12
    startTextButton.layer.borderColor = UIColor.yellow.cgColor
  }
  
}
