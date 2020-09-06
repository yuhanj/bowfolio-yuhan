//
//  UserProfile.swift
//  FireAuthTest
//
//  Created by Yuhan Jiang on 2020/9/1.
//  Copyright © 2020 Yuhan Jiang. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift

struct Profile: Identifiable, Codable {

    @DocumentID var id: String? = UUID().uuidString
    var name: String = ""
    var title: String = ""
    var comment: String = ""
    var projects: [String] = [""]
    var interests: [String] = [""]
    var avatar: String = ""
    
    enum Codingkeys: String, CodingKey {
        case id
        case name
        case title
        case comment
        case projects
        case interests
        case avatar
    }
    
}
