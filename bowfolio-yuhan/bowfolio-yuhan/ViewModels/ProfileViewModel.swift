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
            
            self.profiles = documents.compactMap({ (docSnap) -> Profile? in
//                print(try? docSnap.data(as: Profile.self))
                return try? docSnap.data(as: Profile.self)
            })
            
        }
        
        
    }
}
