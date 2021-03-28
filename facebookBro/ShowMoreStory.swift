//
//  ShowMoreStory.swift
//  facebook
//
//  Created by admin on 2021/1/23.
//

import SwiftUI

struct ShowMoreStory: View {
    var name = [ "yahya abukahlil","Issa Mohmmad","Isono Sugguru","Abu Fares","Obada Abukhadir","Um fares"]
    var profile = ["Fone","Ftwo","Fthree","Ffour","Ffife","Fsix"]
    var StoryImage = ["p1","p2","p3","p4","p5","p6"]
    @EnvironmentObject var userdata:UserData
    var time = Int.random(in: 1..<24)
    var body: some View {
        ZStack{
        VStack {
            StoryBar()
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
                    ForEach(0..<2){ s in
                        StoryLine( StoryImage1: StoryImage[s], profile1: profile[s], name1: name[s], StoryImage2: StoryImage[s+1], profile2: profile[s+1], name2: name[s+1], StoryImage3: StoryImage[s+2], profile3: profile[s+2], name3: name[s+2])
                    }
                    ForEach(0..<2){ s in
                        StoryLine( StoryImage1: StoryImage[s], profile1: profile[s], name1: name[s], StoryImage2: StoryImage[s+1], profile2: profile[s+1], name2: name[s+1], StoryImage3: StoryImage[s+2], profile3: profile[s+2], name3: name[s+2])
                    }
                    ForEach(0..<2){ s in
                        StoryLine( StoryImage1: StoryImage[s+4], profile1: profile[s+2], name1: name[s+3], StoryImage2: StoryImage[s+1], profile2: profile[s+2], name2: name[s+3], StoryImage3: StoryImage[s+3], profile3: profile[s+3], name3: name[s+3])
                    }
            }
                    
        }
                    // ===============start=========================
                    
                    ZStack{
                        if userdata.fullScreenStory  {
                            Color.black.ignoresSafeArea(.all)
                            ZStack {
                                VStack {
                                    ZStack{
                                        Image(userdata.photo)
                                            .resizable()
                                            .frame(width: .infinity, height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        HStack{
                                            Image(userdata.profile)
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                                .padding(.leading)
                                            HStack(alignment: .firstTextBaseline) {
                                                Text(userdata.name)
                                                    .bold()
                                                    .foregroundColor(.white)
                                                    .font(.custom("default", size: 19))
                                                Text("\(time)h")
                                                    .foregroundColor(.white)
                                                    .font(.custom("default", fixedSize: 12))
                                            }
                                            Spacer()
                                            ZStack {
                                                Button(action: {userdata.fullScreenStory=false }, label: {
                                                    Image(systemName: "xmark")
                                                        .padding(.trailing)
                                                        .foregroundColor(.white)
                                                })
                                            }
                                        }
                                        .offset(x: 0, y: -300)
                                        loader1()
                                            .offset(x: 0, y: -330)
                                    }.transition(.slide)
//                                    Spacer()
                                }
                            }
                        }
                        
                    }
            
                    // ===============end===========================
            
       
            
        } // end of main ZStak
       
    } // end of body
}

         
           

struct ShowMoreStory_Previews: PreviewProvider {
    static var previews: some View {
        ShowMoreStory()
    }
}
struct StoryLine:View{
    @State var Like = false
    @State var index = 0
    @State var StoryImage1:String
    @State var profile1:String
    @State var name1:String
    @State var StoryImage2:String
    @State var profile2:String
    @State var name2:String
    @State var StoryImage3:String
    @State var profile3:String
    @State var name3:String
    @EnvironmentObject var userdata:UserData
    @State var tapped1 = false
    @State var tapped2 = false
    @State var tapped3 = false
    var body: some View{
        HStack{
            ZStack {
                Image(StoryImage1)
                    .resizable()
                    .frame(width: 130, height: 230)
                    .cornerRadius(10)
                    .shadow(radius: 1)
                ZStack {
                    Circle()
                        .frame(width: 45, height: 45)
                        .foregroundColor(tapped1 ?.white:.blue)

                    Image(profile1)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .shadow(radius: 2)
                }.offset(x:-35,y:-80)
                
                Button(action: {self.Like.toggle()
                    index=0
                }, label: {
                    Image(systemName:"heart.fill")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .padding(10)
                        .foregroundColor(Like&&index==0 ? .red:.white)
                        .background(Color.black.opacity(0.6))
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }).offset(x: 40, y: 90)
                
                VStack(alignment: .leading) {
                    Text(name1)
                        .bold()
                        .frame(width: 80, height: 50)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .font(.caption)
                        .shadow(radius: 2)
                    
                        
                }.offset(x: -30, y: 90)
            }.onTapGesture {
                userdata.names = name1
                userdata.profile = profile1
                userdata.photo = StoryImage1
                userdata.fullScreenStory = true
                tapped1 = true
            }
            
            ZStack {
                Image(StoryImage2)
                    .resizable()
                    .frame(width: 130, height: 230)
                    .cornerRadius(10)
                    .shadow(radius: 1)
                ZStack {
                    Circle()
                        .frame(width: 45, height: 45)
                        .foregroundColor(tapped2 ?.white:.blue)

                    Image(profile2)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .shadow(radius: 2)
                }.offset(x:-35,y:-80)
                Button(action: {self.Like.toggle()
                    index=1
                }, label: {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .padding(10)
                        .foregroundColor(Like&&index==1 ? .red:.white)
                        .background(Color.black.opacity(0.6))
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }).offset(x: 40, y: 90)
                VStack(alignment: .leading) {
                    Text(name2)
                        .foregroundColor(.white)
                        .bold()
                        .font(.caption)
                        .shadow(radius: 2)
                        .frame(width: 80, height: 50)
                        .multilineTextAlignment(.leading)
                        
                }.offset(x: -30, y: 90)
            }.onTapGesture {
                userdata.names = name2
                userdata.profile = profile2
                userdata.photo = StoryImage2
                userdata.fullScreenStory = true
                tapped2 = true
            }
            
            ZStack {
                Image(StoryImage3)
                    .resizable()
                    .frame(width: 130, height: 230)
                    .cornerRadius(10)
                    .shadow(radius: 1)
                ZStack {
                    Circle()
                        .frame(width: 45, height: 45)
                        .foregroundColor(tapped3 ?.white:.blue)

                    Image(profile3)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .shadow(radius: 2)
                }.offset(x:-35,y:-80)
                Button(action: {self.Like.toggle()
                    index=2
                }, label: {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .padding(10)
                        .foregroundColor(Like&&index==2 ? .red:.white)
                        .background(Color.black.opacity(0.6))
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }).offset(x: 40, y: 90)
                VStack(alignment: .leading) {
                    Text(name3)
                        .foregroundColor(.white)
                        .bold()
                        .font(.caption)
                        .shadow(radius: 2)
                        .multilineTextAlignment(.leading)
                        .frame(width: 80, height: 50)
                        
                }.offset(x: -30, y: 90)
            }.onTapGesture {
                userdata.names = name3
                userdata.profile = profile3
                userdata.photo = StoryImage3
                userdata.fullScreenStory = true
                tapped3 = true
            }
            
        }
    }
}
struct StoryBar:View{
    @State var GoBack = false
    var body: some View{
        HStack{
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "clock.arrow.2.circlepath")
                    .padding(.leading)
                    .foregroundColor(.black)
            })
            Spacer()
            Text("Stories")
                .bold()
            Spacer()
            Button(action: {self.GoBack.toggle()}, label: {
                Image(systemName: "xmark")
                    .padding(.trailing)
                    .foregroundColor(.black)
            })
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {}).fullScreenCover(isPresented: $GoBack, content: {
                ContentView()
            })
            
        }.padding(.bottom)
        
    }
}
struct loader1:View{
    @State var width:CGFloat = 100
    var time = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State var secs:CGFloat = 0
    @EnvironmentObject var userdata:UserData
    var body: some View{
        ZStack(alignment:.leading ){
            Rectangle()
                .fill(Color.white.opacity(0.6))
                .frame(height:3)
            
            Rectangle()
                .fill(Color.white)
                .frame(width: self.width, height: 3)
            
        }
        .onReceive(self.time, perform: { _ in
            secs += 0.1
            if secs <= 4 {
                let screenWidth = UIScreen.main.bounds.width
                self.width = screenWidth * (self.secs/3.9)
            }else{
                userdata.fullScreenStory = false
                time.upstream.connect().cancel()
            }

           
        })
    }
}

        
