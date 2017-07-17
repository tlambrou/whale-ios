//
//  AnswerCollectionViewCell.swift
//  whale-ios-tassos
//
//  Created by Tassos Lambrou on 4/3/17.
//  Copyright © 2017 SsosSoft. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

class AnswerCollectionViewCell: UICollectionViewCell {
  
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var profileImage: UIImageView!
  @IBOutlet weak var questionLabel: UITextView!
  
  let answer: Answer? = nil

  var answerCellViewModel: JSONAnswer? {
    didSet {
      nameLabel.text = answerCellViewModel?.username
      
    }
  }
  
}
