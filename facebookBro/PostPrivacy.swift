//
//  PostPrivacy.swift
//  facebook
//
//  Created by admin on 2021/1/24.
//

import SwiftUI

struct PostPrivacy: View {
    var body: some View {
        VStack {
            ToolBar()
            Spacer()
        }
    }
}

struct PostPrivacy_Previews: PreviewProvider {
    static var previews: some View {
        PostPrivacy()
    }
}
struct ToolBar:View{
    @State var Finish = false
    var listitems = ["Public","Friends","Friends except...","Specific friends","Only me","Close Friends"]
    var listItemDescription = ["Anyone on or off Facebook","Your Friends on facebook","Don't show to someone","Only show to some friends","Only me","Your custom list"]
    var icons = ["globe","person.2.fill","person.fill.badge.minus","person.fill","lock.fill","star.fill"]
    @State var GoToExceptedList = false
    var body: some View{
        VStack {
            HStack {
                Button(action: {Finish.toggle()}, label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .padding(.leading)
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {}).fullScreenCover(isPresented: $Finish, content: {
                    CreatePost()
                })
                Spacer()
                Text("Post Audience")
                    .padding(.leading,-30)
                Spacer()
            }
            Rectangle()
                .frame(width: .infinity, height: 0.4)
                .foregroundColor(Color(.lightGray))
            VStack(alignment: .leading) {
                Text("Who can see this post?").bold().font(.title3)
                Text("Your post will shhow up in News  Feed ,on your profile")
                Text("and in search results.").padding(.bottom)
                Text("Your default audience is set to Public, but you can")
                Text("change the audience of this specific post.").padding(.bottom)
                Text("Choose Audience")
                    .bold()
                    .font(.title3)
            }.padding(.leading,6)
            
            List{
                ForEach(0..<6){s in
                    ZStack {
                        ListItemPrivacy(IsOne: s==0 ? true:false, title: listitems[s], descrpition: listItemDescription[s], icon: icons[s])
                                .onTapGesture {
                                    if s==2 {
                                        GoToExceptedList.toggle()
                                    }
                            }
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {}).fullScreenCover(isPresented: $GoToExceptedList, content: {
                            ExceptedList()
                        })
                    }
                       
                  }
                    
                }
               
            }
            Spacer()
            Button(action: {Finish.toggle()}, label: {
                Text("Done")
                    .padding(.leading,150)
                    .padding(.trailing,150)
                    .padding(.top,10)
                    .padding(.bottom,10)
                    .background(Color("addFriendBlueButton"))
                    .foregroundColor(.white)
                    .cornerRadius(8)
            })
        }
    }

struct ListItemPrivacy:View{
    @State var IsOne = false
    @State var title:String
    @State var descrpition:String
    @State var icon:String
    var body: some View{
        HStack{
            Image(systemName: icon)
                .resizable()
                .frame(width: 25, height: 25)
            VStack(alignment: .leading){
                Text(title).bold()
                Text(descrpition)
                    .font(.caption)
                    .foregroundColor(Color(.darkGray))
            }
            Toggle(isOn: $IsOne , label: {})
        }
    }
}
