//
//  SessionStore.swift
//  FireAuthTest
//
//  Created by Yuhan Jiang on 2020/8/30.
//  Copyright © 2020 Yuhan Jiang. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
import Combine
import SwiftUI

class SessionStore: ObservableObject {
    
    var didChange = PassthroughSubject<SessionStore, Never>()
    @Published var session: User? {didSet {self.didChange.send(self)}}
    var handle: AuthStateDidChangeListenerHandle?
    let db = Firestore.firestore()
    
    func getUser() -> String {
        return self.session?.email ?? ""
    }
    
//    func createProfile() {
//        db.collection("userProfiles").document(session?.uid ?? "007").setData(["name": session?.email ?? "", "id": session?.uid ?? "007", "comment": "Say something!"])
//
//    }

    func listen() {
        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if let user = user {
                self.session = User(uid: user.uid, email: user.email)
            } else {
                self.session = nil
            }
        })
    }
    
    func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
        
    }
    
    func signIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.session = nil
        }
        catch {
            print("Error signing out")
        }
    }
    
    func unbind() {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    deinit {
        unbind()
    }
}


struct User {
    var uid: String
    var email: String?
    
    init(uid:String, email: String?) {
        self.uid = uid
        self.email = email
    }
}
