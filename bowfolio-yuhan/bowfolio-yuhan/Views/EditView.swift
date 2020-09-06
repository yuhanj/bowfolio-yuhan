//
//  EditView.swift
//  bowfolio-yuhan
//
//  Created by Yuhan Jiang on 2020/9/5.
//  Copyright © 2020 Yuhan Jiang. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct EditView: View {
    @EnvironmentObject var session: SessionStore
    @EnvironmentObject var profiles: ProfileViewModel
    @Binding var profile: Profile
    @State var userName: String = ""
    @State var title: String = ""
    @State var comment: String = ""
    
    func editProfile(){
        let db = Firestore.firestore()
        db.collection("Profiles").document(profile.id!).setData(["name": userName, "title": title, "comment": comment], merge: true)
    }
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                VStack{
                    Text("Change Profile")
                        .font(.system(size: 32, weight: .heavy))
                    Text("Edit your personal information")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.gray)
                }
                .padding(.top, -130)
                
                VStack(spacing: 18) {
                    TextField("User Name", text: $userName)
                        .font(.system(size: 14))
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.gray), lineWidth: 1))
                    TextField("Title", text: $title)
                        .font(.system(size: 14))
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.gray), lineWidth: 1))
                    TextField("Comment", text: $comment)
                        .font(.system(size: 14))
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.gray), lineWidth: 1))
                }
                .padding(.top, -40)
                .padding(.bottom, 40)
                
                
                Button(action: {
                    self.editProfile()
                }) {
                    Text("Edit Profile")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .bold))
                        .background(LinearGradient(gradient: Gradient(colors: [Color("bg2"), Color("bg1")]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(5)

                }
                
                Spacer()
            }
            .padding(.horizontal, 32)
        }
    }
}
