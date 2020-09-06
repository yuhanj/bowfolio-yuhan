//
//  UserProfileViewModel.swift
//  FireAuthTest
//
//  Created by Yuhan Jiang on 2020/9/1.
//  Copyright © 2020 Yuhan Jiang. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class ProfileViewModel: ObservableObject {
    
    @Published var profiles = [Profile]()
    private var db = Firestore.firestore()
    
    func fetchData() {
        let ref = db.collection("Profiles")
        ref.addSnapshotListener { (snap, error) in
            guard let documents = snap?.documents else {
                print("no documents")
                return
            }
            self.profiles = documents.map({ (docSnap) -> Profile in
                
                let data = docSnap.data()
                let id = data["id"] as? String ?? ""
                let name = data["name"] as? String ?? ""
                let title = data["title"] as? String ?? ""
                let comment = data["comment"] as? String ?? ""
                let projects = data["projects"] as? [String] ?? [""]
                let interests = data["interests"] as? [String] ?? [""]
                let avatar = data["avatar"] as? String ?? ""
                
                
                return Profile(id: id, name: name, title: title, comment: comment, projects: projects, interests: interests, avatar: avatar)
            })
            
        }
        print(self.profiles)
    }
}
