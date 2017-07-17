//
//  WhaleAPI.swift
//  whale-ios-tassos
//
//  Created by Tassos Lambrou on 3/28/17.
//  Copyright © 2017 SsosSoft. All rights reserved.
//

import Foundation
import Alamofire
import KeychainSwift


struct NetworkingConstants{
  
  static let baseUrl = "https://whale2-elixir.herokuapp.com/api/v1"
  static let users = "users"
  static let login = "sessions"
  static let questions = "questions"
  static let answers = "answers"
  static let likes = "likes"
  static let comments = "commments"
  static let data = "data"
  
  static let per_page = "per_page"
  static let total_pages = "total_pages"
  static let page = "page"
  
}


struct CommentConstants {
  
  static let id = "id"
  static let answerId = "answer_id"
  static let content = "content"
  static let commenter = "commenter"
  
}


struct UserConstants{
  
  static let username = "username"
  static let lastName = "last_name"
  static let imageUrl = "image_url"
  static let id = "id"
  static let followingCount = "following_count"
  static let followeeCount = "followee_count"
  static let firstName = "first_name"
  static let email = "email"
  static let authentication = "Authorization"
}

struct AnswerConstants{
  
  static let videoUrl = "video_url"
  static let thumbnail_url = "thumbnail_url"
  static let question = "question"
  static let sender = "sender"
  static let username = "username" // Repeat
  static let last_name = "last_name"
  static let first_name = "first_name"
  static let image_url = "image_url"
  static let id = "id"
  static let email = "email"
  static let receiver = "receiver"
  static let content = "content"
  static let likes_count = "likes_count"
  static let comment_count = "comment_count"
}

struct QuestionConstants {
  
  static let sender = "sender"
  static let receiver = "receiver"
  static let content = "content"
  
  
}

enum WhaleRouter : URLRequestConvertible {
  
  static let pageSize = 4
  
  
  case getUsers(page: Int)
  case createUser(email: String, first_name: String, last_name: String, password: String, username: String, image_url: URL?)
  case loginUser(email: String, password: String)
  
  case getAnswers(page: Int)
  case getAnswerComments(answerId: String, page: Int)
  case getAnswerLikes(answerId : String)
  case createAnswer
  
  case getMyQuestions(page: Int)
  case createQuestion(receiver_id: Int, content: String)
  
  
  var path: String {
    
    switch self {
      
    case .loginUser:
      return NetworkingConstants.login
      
      
      
    case .getUsers, .createUser:
      return NetworkingConstants.users
      
      
    case .getAnswers, .createAnswer:
      return NetworkingConstants.answers
      
      
    case let .getAnswerLikes(answerId):
      return NetworkingConstants.answers + "/" + answerId + NetworkingConstants.likes
      
      
    case let .getAnswerComments(answerId, _):
      return NetworkingConstants.answers + "/" + answerId + NetworkingConstants.comments
      
      
    case .getMyQuestions, .createQuestion:
      return NetworkingConstants.questions
      
    }
    
  }
  
  var body : [String: Any]{
    
    var bodyDict: [String: Any] = [:]
    
    switch self {
      
    case let .createUser(email: email, first_name: first, last_name: last, password: pass, username: username, image_url: url):
      bodyDict["email"] = email
      bodyDict["first_name"] = first
      bodyDict["last_name"] = last
      bodyDict["password"] =  pass
      bodyDict["username"] = username
      
      if let url = url {
        
        bodyDict["image_url"] =  url
        
      }
      
    default:
      print("no action")
      
    }
    
    return bodyDict
  }
  
  
  var parameters: [String: Any] {
    
    var paramDict : [String: Any] = [:]
    
    switch self {
      
    case let .getUsers(page), let .getAnswers(page: page), let .getAnswerComments(_, page), let .getMyQuestions(page: page):
      paramDict["page"] = page
      paramDict["per_page"] = WhaleRouter.pageSize
      
      
    case let .loginUser(email, password):
      paramDict["email"] = email
      paramDict["password"] = password
      
      
    default:
      break
    }
    
    return paramDict
    
  }
  
  
  
  var method: HTTPMethod {
    switch self {
    case .getUsers, .getAnswers, .getAnswerLikes, .getAnswerComments, .getMyQuestions:
      return .get
      
    // TODO: Build out more cases
    case .createUser, .createAnswer, .createQuestion, .loginUser:
      return .post
    }
  }
  
  
  var headers: HTTPHeaders {
    
    var headers : [String:String] = [:]
    
    
    switch self {
      
    case .getAnswers, .getAnswerLikes, .getAnswerComments, .createAnswer, .getMyQuestions, .createQuestion, .createAnswer:
      
      headers[UserConstants.authentication] = KeychainSwift().get("token")
      
    default:
      break
    }
    
    return headers
    
  }
  
  
  
  func asURLRequest() throws -> URLRequest {
    
    let url = try NetworkingConstants.baseUrl.asURL()
    var urlRequest = URLRequest(url: url.appendingPathComponent(path))
    
    urlRequest.httpMethod = method.rawValue
    urlRequest.allHTTPHeaderFields = headers
    
    print(urlRequest.url?.absoluteString)
    
    return try URLEncoding.methodDependent.encode(urlRequest, with: parameters)
    
  }
}

enum paging {
  
  case pageUp
  case pageDown
  
}


struct WhaleAPI {
  
  var requestParams: requestParameters?
  
  init (resource: requestParameters.resource, route: requestParameters.route, method: requestParameters.method) {
    switch method {
    case .get: break
    case .post:
      case
    default:
      <#code#>
    }
  }
  
  func whaleService(requestParameters: requestParameters) {
    
    switch requestParams {
    case <#pattern#>:
      <#code#>
    default:
      <#code#>
    }
   
    Alamofire.request(requestParameters., method: <#T##HTTPMethod#>, parameters: <#T##Parameters?#>, encoding: <#T##ParameterEncoding#>, headers: <#T##HTTPHeaders?#>)
  }
  
}
