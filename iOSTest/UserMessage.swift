//
//  UserMessage.swift
//  iOSTest
//
//  Created by Tashnik on 5/24/21.
//  Copyright © 2021 D&ATechnologies. All rights reserved.
//

import Foundation


struct UserMessage: Decodable {
  
  let user_id: String
  let name: String
  let avatar_url: String
  let message: String
}

struct UserMessageResponse: Decodable {
  
  let data: [UserMessage]
}
