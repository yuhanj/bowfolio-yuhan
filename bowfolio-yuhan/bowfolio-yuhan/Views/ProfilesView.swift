//
//  ProfilesView.swift
//  bowfolio-yuhan
//
//  Created by Yuhan Jiang on 2020/9/4.
//  Copyright © 2020 Yuhan Jiang. All rights reserved.
//

import SwiftUI

struct ProfilesView: View {
    
    @EnvironmentObject var session: SessionStore
    @EnvironmentObject var profiles: ProfileViewModel
    
    
    var body: some View {
//        List(self.profiles.profiles){ profile in
//            ProfileRowView(profile: profile)
//        }
        Button(action: {
            self.profiles.fetchData()
            print(self.profiles.profiles)
        }) {
            Text("refresh")
        }
    }
}

struct ProfilesView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilesView().environmentObject(SessionStore()).environmentObject(ProfileViewModel())
    }
}
