//
//  UserProfileViewModel.swift
//  FireAuthTest
//
//  Created by Yuhan Jiang on 2020/9/1.
//  Copyright © 2020 Yuhan Jiang. All rights reserved.
//

import Foundation
import FirebaseFirestore

class ProfileViewModel: ObservableObject {
    
    @Published var profiles = [Profile]()
    private var db = Firestore.firestore()
    
    func fetchData() {
        profiles = []
        
        
    }

    
    
}
