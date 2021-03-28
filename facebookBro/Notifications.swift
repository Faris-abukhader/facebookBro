//
//  Notifications.swift
//  facebook
//
//  Created by admin on 2020/12/31.
//

import SwiftUI

struct Notifications: View {
    @State var Hide = false
    @State var GoToSeeAll = false
    var profileIcon = ["Fone","Ftwo","Fthree","Ffour","Ffife","Fsix","gl1","gl2","gl3","gl4","gl5","gl6","gl7","gl8","gl9"]
    var labels = [ "yahya abukahlil","Issa Mohmmad","Isono Sugguru","Abu Fares","Obada Abukhadir","Um fares","Googler","MR BEAST","ASTRONOMY LOVER","expat in china","Swiftui","Python","Animals Lover","Students in china","ABU SRWAL"]
    var body: some View {
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false) {
                NotificatonsBar()
                NewWord()
                Spacer()
                ForEach(0..<profileIcon.count){ s in
                    if s==4{
//                        peopleMayYou(IsHide: Hide)
                        HStack {
                            if Hide{
                                
                            }else{
                                Text(Hide ? " ":"People You May Know")
                            .bold()
                            .padding(.leading)
                            Spacer()
                                
                        }
                            Button(action: {
                                Hide.toggle()
                            }, label: {
                                if Hide{Spacer()}
                                Text(Hide ? "Show":"Hide")
                                .padding(.trailing)

                        })
                        
                        }

                        if !Hide {
                            Rectangle()
                                .frame(width: .infinity, height: 0.4, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color(.lightGray))
                            ScrollView(.horizontal, showsIndicators: false){
                         
                                HStack{
                                    ForEach(0..<10){s in
                                        PeopleMayYouKnow(image: profileIcon[s], name: labels[s])
                                            .padding(.vertical)
                                    }
                                    seeAll()
                                        .padding(.horizontal)
                                        .onTapGesture {
                                            GoToSeeAll.toggle()
                                        }

                                    Button(action: {
                                        GoToSeeAll.toggle()
                                    }, label: { }).fullScreenCover(isPresented: $GoToSeeAll, content: {
                                        SeeAllView()
                                    })

                                }
                                .padding(.leading)
                               
                            }
                            Rectangle()
                                .frame(width: .infinity, height: 0.4, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color(.lightGray))
                                .padding(.bottom)
                        }else{}
                        
                    }
                    NotificationsElements(image: profileIcon[s], label: labels[s])
                }

            }
           
        
    }
}

struct Notifications_Previews: PreviewProvider {
    static var previews: some View {
        Notifications()
    }
}
struct NotificatonsBar: View {
    @State var IsSearching = false
    var body: some View {
        HStack{
            Text(IsSearching ? "":"Notification")
            .font(.title)
            .bold()
                .foregroundColor(.black)
            .padding()
            Spacer()
            ZStack{
                if IsSearching {
                    TextField("    Search Facebook", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .frame(width: 360, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color(.white))
                        .cornerRadius(20)
                        .shadow(radius: 2)
                        .offset(x: -30, y: 0)
                        .padding(.vertical)
                        
                        
                }
                Button(action: {
                    IsSearching.toggle()
                }, label: {
                    Image(systemName: IsSearching ? "chevron.left":"magnifyingglass")
                        .resizable()
                        .frame(width: IsSearching ? 10:20, height: IsSearching ? 15:20)
                        .padding(8)
                        .padding(.leading,IsSearching ? 5:0)
                        .background(Color(IsSearching ?.lightText:.quaternaryLabel))
                        .cornerRadius(50)
                }).offset(x: IsSearching ? -235:10, y: 0)
//                .padding(.trailing,-15)
                .foregroundColor(.black)
               
            }
            
            if !IsSearching {
                Button(action: {
                    
                }, label: {
                    ZStack {
                        Image(systemName: "message.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                            .padding(8)
                            .background(Color(.quaternaryLabel))
                            .cornerRadius(50)
                        Image(systemName: "bolt.fill")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .rotationEffect(.degrees(180))
                            .foregroundColor(Color("FacebookGray"))
                            .offset(y: -1)

                    }

                })
                .padding()
                .foregroundColor(.black)
            }else{
                
            }

        }.offset(x: IsSearching ? 10:0, y: 0)    }
}
struct NewWord:View{
    var body: some View{
        HStack{
            Text("New")
                .bold()
                .font(.title3)
                .padding()
                
            Spacer()
        }
    }
}
struct NotificationsElements:View{
    @State var image:String
    @State var label:String
    var body: some View{
        HStack {
            ZStack {
                Image(image)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 2)
                ZStack {
                    Circle()
                        .frame(width: 13, height: 13, alignment: .center)
                        .foregroundColor(Color("NotificionBackroundColor"))
                    Image(systemName: "bell.fill")
                        .resizable()
                        .frame(width: 8, height: 8, alignment: .center)
                        .foregroundColor(.white)
                    
                    
                    
                }.offset(x: 15, y: 15)
            }
            .padding(.leading)
//            Spacer()
            
            VStack(alignment: .leading){
          
                Text("\(label) undate his status")
                    .padding(.top,-20)
                Text("5h")
                    .font(.caption2)
            }
            Spacer()
            Image(systemName: "ellipsis")
                .padding(.trailing)
        }
       
    }
}
struct PeopleMayYouKnow:View{
    @State var image:String
    @State var name:String
    var num = Int.random(in: 10..<50)
    var body: some View{
        ZStack {
                Rectangle()
                    .frame(width: 160, height: 180, alignment: .center)
                    .cornerRadius(15)
                    .shadow(radius: 1)
                    .foregroundColor(.white)
                Image(image)
                    .resizable()
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 1)
                    .offset(x: 0, y: -40)
                Text(name)
                    .offset(x: 0, y: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                Text("\(num) muntal friends")
                    .font(.caption2)
                    .offset(x: 0, y: 30)
                    .foregroundColor(Color(.darkGray))
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Add friends")
                    .font(.caption2)
                        .padding(.horizontal,30)
                        .padding(.top,5)
                        .padding(.bottom,5)
                        .background(Color("FacebookBlueBackgroundButton"))
                        .cornerRadius(8)

                    
                })
                .offset(x: 0, y: 60)
        }
    }
}
struct seeAll:View{
    var body: some View{
        VStack {
         
           Image(systemName: "arrow.right")
            .resizable()
            .frame(width: 30, height: 30)
            .padding()
            .background(Color(.white))
            .cornerRadius(50)
            .shadow(radius: 2)
            Text("See All")
                .padding(.top)
        }
    }
}
