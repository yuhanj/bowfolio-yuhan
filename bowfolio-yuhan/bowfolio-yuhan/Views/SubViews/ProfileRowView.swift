//
//  ProfileRowView.swift
//  bowfolio-yuhan
//
//  Created by Yuhan Jiang on 2020/9/5.
//  Copyright © 2020 Yuhan Jiang. All rights reserved.
//

import SwiftUI

struct ProfileRowView: View {
    
    var profile: Profile
    var body: some View {
        VStack {
            Text(profile.name)
            Text(profile.comment)
        }
    }
}

