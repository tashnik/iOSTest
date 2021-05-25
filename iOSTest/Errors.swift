//
//  Errors.swift
//  iOSTest
//
//  Created by Tashnik on 5/24/21.
//  Copyright © 2021 D&ATechnologies. All rights reserved.
//

import Foundation

enum Errors: String, Error {
  
  case invalidUsername = "This username created an invalid request"
  case unableToComplete = "Unable to complete request. Please check your internet connection"
  case invalidResponse = "No response from server"
  case invalidData = "Invalid data"
  case unableToFavorite = "There was an error favoriting this user"
  case alreadyInFavorites = "You have already favorited this user"
}
