//
//  ProfileSettings.swift
//  facebook
//
//  Created by admin on 2021/2/1.
//

import SwiftUI

struct ProfileSettings: View {
    var body: some View {
        VStack {
            profileSettingsToolbar()
            ScrollView{
                SettingsList()
                    .padding(.top)
            }
        }
    }
}

struct ProfileSettings_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettings()
    }
}
struct SettingsList:View{
    @State var label = ["Edit Profile","Account Status","Archive","View AS","Activity Log","Review Posts and Tags","View Privacy Shortucts","Search Profile","Memorialization Settings"]
    @State var icons = ["pencil","briefcase","archivebox","eye","list.bullet","list.bullet.below.rectangle","lock","magnifyingglass","person.crop.circle.badge.questionmark"]
    var body: some View{
        VStack(alignment: .leading){
            ForEach(0..<9){ i in
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                HStack(alignment: .firstTextBaseline){
                    VStack {
                        Image(systemName: icons[i])
                            .padding(.leading)
                            .foregroundColor(.black)
                    }
                    
                    VStack(alignment: .leading) {
                            Text(label[i])
                                .padding(.leading)
                                .foregroundColor(.black)

                    }
                    Spacer()
                }
                .padding(.bottom)
                })
                Rectangle()
                    .frame(width: .infinity, height: 0.3, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            Text("Your Profile Link")
                .font(.title2)
                .padding(.leading)
            Text("Your personalized link on Facebook")
                .padding(.leading)
                .font(.footnote)
                .foregroundColor(Color(.darkGray))
            Text("https://facebook.com/fares.abukahder.9")
                .bold()
                .padding(.leading)
                .font(.footnote)
                .padding(.top)
            Button(action: {
                UIPasteboard.general.string = ("https://facebook.com/fares.abukahder.9")
            }, label: {
                Text("Copy Link")
                    .font(.footnote)
                    .foregroundColor(.black)
                    .padding(10)
                    .background(Color("FacebookGrayButton"))
                    .cornerRadius(10)
                    .padding()
            })
            
        }
    }
}
struct profileSettingsToolbar:View{
    @State var GoBack = false
    var body: some View{
        HStack{
            ZStack {
                Button(action: {GoBack.toggle()}, label: {
                    Image(systemName: "chevron.left")
                        .padding(.leading)
                        .foregroundColor(.black)
                })
                Button(action: {}, label: {}).fullScreenCover(isPresented: $GoBack, content: {
                    Profile()
                })
            }
            Spacer()
            Text("Profile Settings")
                .font(.title2)
            Spacer()
        }
    }
}
