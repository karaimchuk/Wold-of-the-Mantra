//
//  MantraTableViewCell.swift
//  Mantra
//
//  Created by Karaimchuk on 19.09.21.
//

import UIKit

class MantraTableViewCell: UITableViewCell {
  @IBOutlet weak public var mantraImage: UIImageView!
  @IBOutlet weak public var mantraTitleText: UILabel!
  @IBOutlet weak var lockImage: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    mantraTitleText.backgroundColor = .white
  }
  
  override var reuseIdentifier: String? {
    return "MantraTableViewCell"
  }
  
  public func configureCellElements (mantraImageArr: String, mantraTitleTextArr: String) {
    mantraImage.image = UIImage(named: mantraImageArr)
    mantraTitleText.text = mantraTitleTextArr
  }
  
}
