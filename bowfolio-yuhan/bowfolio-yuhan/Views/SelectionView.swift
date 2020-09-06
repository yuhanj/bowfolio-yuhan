//
//  SelectionView.swift
//  bowfolio-yuhan
//
//  Created by Yuhan Jiang on 2020/9/5.
//  Copyright © 2020 Yuhan Jiang. All rights reserved.
//

import SwiftUI

struct SelectionView: View {
    @EnvironmentObject var session: SessionStore
    @EnvironmentObject var profiles: ProfileViewModel
    @State var selection: Int = 0
    var body: some View {
        Group {
            if selection == 0 {
                MainView(selection: $selection)
            } else if selection == 1{
                UserView(selection: $selection)
            }
        }
    }
}

struct SelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView().environmentObject(SessionStore()).environmentObject(ProfileViewModel())
    }
}
