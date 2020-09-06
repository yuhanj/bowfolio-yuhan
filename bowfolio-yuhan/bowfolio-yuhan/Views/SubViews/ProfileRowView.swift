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
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text(profile.name)
                        .font(.system(size: 24, weight: .heavy))
                    Text(profile.title)
                    .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.gray)
                }
                Spacer()
                Image(profile.avatar)
                    .resizable()
                .cornerRadius(10)
                    .frame(width: 80, height:80)
            }
            Text(profile.comment)
            .font(.system(size: 16, weight: .medium))
        }
    }
}

