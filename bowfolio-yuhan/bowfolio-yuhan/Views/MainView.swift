//
//  MainView.swift
//  bowfolio-yuhan
//
//  Created by Yuhan Jiang on 2020/9/4.
//  Copyright © 2020 Yuhan Jiang. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var session: SessionStore
    @EnvironmentObject var profiles: ProfileViewModel
    @Binding var selection: Int
    
    var body: some View {
        VStack {
            TopBar(selection: $selection)
            TabView {
                
                ProfilesView()
                    .tabItem {
                        VStack {
                            Image(systemName: "rectangle.stack.person.crop.fill")
                            Text("Profiles")
                        }
                }.tag(0)
                
                ProjectsView()
                    .tabItem {
                        VStack {
                            Image(systemName: "folder.fill")
                            Text("Projects")
                        }
                }.tag(1)
                
                InterestsView()
                    .tabItem {
                        VStack {
                            Image(systemName: "guitars")
                            Text("Interests")
                        }
                }.tag(2)
                
                FilterView()
                    .tabItem {
                        VStack {
                            Image(systemName: "magnifyingglass")
                            Text("Filter")
                        }
                }.tag(3)
                
            }.background(Color("bg4"))
        }
        .edgesIgnoringSafeArea(.top)
        .onAppear {
            self.profiles.fetchData()

        }
    }
    
}

struct TopBar: View {
    @Binding var selection: Int
    var body: some View {
        VStack (spacing: 20){
            HStack {
                Text("Bowfolio")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    // button action
                }) {
                    Image(systemName: "folder.fill.badge.plus")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                }.padding(.trailing, 20)
                
                Button(action: {
                    self.selection = 1
                }) {
                    Image(systemName: "person.fill")
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                    
                }
            }
        }
        .padding()
        .padding(.top, (UIApplication.shared.windows.last?.safeAreaInsets.top)! + 10)
        .background(Color("bg1"))
    }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    PreviewWrapper()
  }

  struct PreviewWrapper: View {
    @State(initialValue: 0) var selection: Int

    var body: some View {
        MainView(selection: $selection).environmentObject(SessionStore()).environmentObject(ProfileViewModel())
    }
  }
}
