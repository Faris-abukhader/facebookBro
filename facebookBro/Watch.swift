//
//  Watch.swift
//  facebook
//
//  Created by admin on 2020/12/28.
//

import SwiftUI

struct Watch: View {
    var images=["food1","food2","food3","food4","food5","food6","food7","food8","food9","food10"]
    var icons = ["tv","video.fill","rectangle.stack.fill.badge.plus","gamecontroller.fill"]
    var labels=["For You","Live","Following","Gaming"]
    var postText = ["Hello Friends","Lovely Pic","Food Lover hh","Live Before I eat it","no food no life","here we go","oh god i can't","After long day of fasting finaly...","come on baby","busmullah"]
    @State var OnlLineImage = ["Fone","Ftwo","Fthree","Ffour","Ffife","Fsix","Fone","Ftwo","Fthree","Ffour","Ffife","Fsix","Fone","Ftwo","Fthree","Ffour"]
    var label = [ "yahya abukahlil","Issa Mohmmad","Isono Sugguru","Abu Fares","Obada Abukhadir","Um fares","yahya abukahlil","Issa Mohmmad","Isono Sugguru","Abu Fares"]

    var body: some View {
        
        VStack {
            
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
                MyToolBarWatch()
                ScrollView(.horizontal , showsIndicators: false) {
                   
                    HStack {
                        ForEach(0..<4){ d in
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                WatchForYou(icons: icons[d], label: labels[d])
                            })
                        }
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            WatchForYou1(icons: "restaurant", label: "Food")
                        })
                    }.padding(.leading)
                }
                    
                    Spacer()
                    VStack{
                        
                        ForEach(0..<10){s in
                            Postes(imagess: images[s], PostText: postText[s],profile: OnlLineImage[s],name:label[s])
                                .padding(.horizontal,5)
                        }
                    }
               
            }
        }
        
       
        
    }
}

struct Watch_Previews: PreviewProvider {
    static var previews: some View {
        Watch()
    }
}

struct MyToolBarWatch: View {
    @State var IsSearching = false
    var body: some View {
        HStack{
            Text(IsSearching ? "":"Watch")
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

        }.offset(x: IsSearching ? 10:0, y: 0)
    }
}

struct WatchForYou:View{
    @State var icons:String
    @State var label:String
    var body: some View{
        ZStack {
            
            Capsule()
                .frame(width: 100, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color(.quaternaryLabel))
            
            HStack{
                Image(systemName: icons)
                    .resizable()
                    .frame(width: 17, height:15, alignment: .center)
                    .foregroundColor(Color(.darkGray))
                Text(label)
                    .font(.subheadline)
                    .foregroundColor(.black)
                
                
                
            }
                
           
        }
    }
}
struct WatchForYou1:View{
    @State var icons:String
    @State var label:String
    var body: some View{
        ZStack {
            
            Capsule()
                .frame(width: 100, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color(.quaternaryLabel))
            
            HStack{
                Image( icons)
                    .resizable()
                    .frame(width: 15, height:15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.black)
                    Text(label)
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .offset(x: 0, y: -0)
                    

                
            }
                
           
        }
    }
}
