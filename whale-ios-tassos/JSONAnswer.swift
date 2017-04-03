//
//  JSONAnswer.swift
//  whale-ios-tassos
//
//  Created by Tassos Lambrou on 3/27/17.
//  Copyright © 2017 SsosSoft. All rights reserved.
//

import Foundation
import Gloss

struct PageData<Tassos: Decodable> {
  var totalPages: Int = 0
  var pageSize: Int = 0
  var currentPage: Int = 0
  let data: [Tassos]
}


extension PageData: Decodable {
  init?(json: JSON) {
    guard let data: [Tassos] = "data" <~~ json,
      let totalPages: Int = "total_pages" <~~ json,
      let pageSize: Int = "per_page" <~~ json,
      let currentPage: Int = "page" <~~ json
      else {return nil}
    
    self.data = data
    self.totalPages = totalPages
    self.pageSize = pageSize
    self.currentPage = currentPage
  }
}

struct JSONAnswer {
  let id: Int
  let videoURL: URL
  let thumbnailURL: URL
  //let question: JSONQuestion
  let likesCount: Int
  let commentsCount: Int
}


extension JSONAnswer: Decodable {
  init?(json: JSON) {
    guard let id: Int = "id" <~~ json,
      let videoURL: URL = "video_url" <~~ json,
      let thumbnailURL: URL = "thumbnail_url" <~~ json
      //   let question: JSONQuestion = "question" <~~ json
      else {return nil}
    
    self.id = id
    self.videoURL = videoURL
    self.thumbnailURL = thumbnailURL
    //self.question = question
    self.likesCount = "likes_count" <~~ json ?? 0
    self.commentsCount = "comment_count" <~~ json ?? 0
  }
}

//let answerData = response.map(PageData<JSONAnswer>.self)
//answerData.data


