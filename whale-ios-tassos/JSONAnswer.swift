//
//  JSONAnswer.swift
//  whale-ios-tassos
//
//  Created by Tassos Lambrou on 3/27/17.
//  Copyright © 2017 SsosSoft. All rights reserved.
//

import Foundation
import Gloss

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

/*let task = session.dataTaskWithRequest(urlRequest) { data, response, error in
  if let data = data {
    let json = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0))
    let post = JSONAnswer(json: json as! JSON)
    print(post)
  }
} */
//postTask.resume()
