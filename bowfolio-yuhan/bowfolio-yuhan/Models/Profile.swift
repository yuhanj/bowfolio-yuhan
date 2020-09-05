//
//  UserProfile.swift
//  FireAuthTest
//
//  Created by Yuhan Jiang on 2020/9/1.
//  Copyright © 2020 Yuhan Jiang. All rights reserved.
//

import Foundation

struct Profile: Identifiable {

    var id: String = ""
    var name: String = ""
    var comment: String = ""
    var projects: [String] = [""]
    var interests: [String] = [""]
    var avatar: String = ""
    
}
