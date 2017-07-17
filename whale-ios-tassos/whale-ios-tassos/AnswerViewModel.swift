//
//  AnswerViewModel.swift
//  whale-ios-tassos
//
//  Created by Tassos Lambrou on 4/7/17.
//  Copyright © 2017 SsosSoft. All rights reserved.
//

import Foundation

struct Answer {
  
  let id: Int
  let videoURL: URL
  let thumbnailURL: URL
  let likesCount: Int
  let commentsCount: Int
  let username: String
  let firstName: String
  let lastName: String
  
  init(JSONAnswer: JSONAnswer) {
    id = JSONAnswer.id
    videoURL = JSONAnswer.videoURL
    thumbnailURL = JSONAnswer.thumbnailURL
    likesCount = JSONAnswer.likesCount
    commentsCount = JSONAnswer.commentsCount
    username = JSONAnswer.username
    firstName = JSONAnswer.firstName
    lastName = JSONAnswer.lastName
    
  }
  
}

class AnswerPage {
  static var numberPerPage: Int = 4
  static var pageNumber: Int = 1
  static var totalPages: Int?
}

