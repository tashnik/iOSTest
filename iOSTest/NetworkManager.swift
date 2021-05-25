//
//  NetworkManager.swift
//  iOSTest
//
//  Created by Tashnik on 5/21/21.
//  Copyright © 2021 D&ATechnologies. All rights reserved.
//

import UIKit

class NetworkManager {
  
  static let shared = NetworkManager()
  
  private let cache = NSCache<NSString, UIImage>()
  
  var baseURL = "https://dev.rapptrlabs.com/Tests/scripts/login.php"
  
  private init() {}
  
  func getLogin(for email: String, password: String, completed: @escaping (Result<[EmailLogin], Errors>, _ time: Double) -> Void) {
    
    let startDate = Date()
    let endpoint = baseURL + "?email=\(email)&password=\(password)"
    
    guard let url = URL(string: endpoint) else {
      let time = Date().timeIntervalSince(startDate)
      completed(.failure(.invalidUsername), time)
      return
    }
    
    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
      if let _ = error {
        let time = Date().timeIntervalSince(startDate)
        completed(.failure(.unableToComplete), time)
        return
      }
      
      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        let time = Date().timeIntervalSince(startDate)
        completed(.failure(.invalidResponse), time)
        return
      }
      
      guard let data = data else  {
        let time = Date().timeIntervalSince(startDate)
        completed(.failure(.invalidData), time)
        return
      }
      
      do {
        let decoder = JSONDecoder()
        let decodedResponse = try decoder.decode(EmailLogin.self, from: data)
        let time = Date().timeIntervalSince(startDate)
        completed(.success([decodedResponse]), time)
      } catch {
        let time = Date().timeIntervalSince(startDate)
        completed(.failure(.invalidData), time)
      }
    }
    
    task.resume()
  }
  

  func downloadUserMessages(completed: @escaping (Result<[UserMessage], Errors>, _ time: Double) -> Void) {
    
    let startDate = Date()
    let endpoint = "https://dev.rapptrlabs.com/Tests/scripts/chat_log.php"
    
    guard let url = URL(string: endpoint) else {
      let time = Date().timeIntervalSince(startDate)
      completed(.failure(.invalidUsername), time)
      return
    }
    
    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
      if let _ = error {
        let time = Date().timeIntervalSince(startDate)
        completed(.failure(.unableToComplete), time)
        return
      }
      
      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        let time = Date().timeIntervalSince(startDate)
        completed(.failure(.invalidResponse), time)
        return
      }
      
      guard let data = data else  {
        let time = Date().timeIntervalSince(startDate)
        completed(.failure(.invalidData), time)
        return
      }
      
      do {
        let decoder = JSONDecoder()
        let decodedResponse = try decoder.decode(UserMessageResponse.self, from: data)
        let time = Date().timeIntervalSince(startDate)
        completed(.success(decodedResponse.data), time)
      } catch {
        let time = Date().timeIntervalSince(startDate)
        completed(.failure(.invalidData), time)
      }
    }
    
    task.resume()
  }
  
  
  func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
    
    let cacheKey = NSString(string: urlString)
    
    if let image = cache.object(forKey: cacheKey) {
      completed(image)
      return
    }
    
    guard let url = URL(string: urlString) else {
      completed(nil)
      return
    }
    
    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
      
      guard let data = data, let image = UIImage(data: data) else {
        completed(nil)
        return
      }
      
      self.cache.setObject(image, forKey: cacheKey)
      completed(image)
    }
    
    task.resume()
  }
}
