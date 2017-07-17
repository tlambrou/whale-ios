//
//  AnswerViewController.swift
//  whale-ios-tassos
//
//  Created by Tassos Lambrou on 4/3/17.
//  Copyright © 2017 SsosSoft. All rights reserved.
//

import Foundation
import UIKit

class AnswerViewController: UIViewController {
  
  @IBOutlet weak var answerCollectionView: UICollectionView!
  
  override func viewDidLoad() {
    let answerCell = UINib(nibName: "AnswerCollectionViewCell", bundle: Bundle.main)
    answerCollectionView.register(answerCell, forCellWithReuseIdentifier: "AnswerCollectionViewCell")
  }
  
}
