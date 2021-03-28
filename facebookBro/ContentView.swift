//
//  ContentView.swift
//  facebook
//
//  Created by admin on 2020/12/27.
import SwiftUI
import CoreData
struct displayBarTab{
    static var hidden = false
    
}

struct ContentView: View {
    @EnvironmentObject var userdata:UserData
    init() {
        // this is from UIKIT for edit and change  tab bar color
        UITabBar.appearance().barTintColor = UIColor.white
    }
    
    @State var B = false
    @State var dragPositon = CGSize.zero
    @State var ListPopUp = false
    //show story views
    @State var goBack = false
    @State var SelectedTag = 1
    var time = Int.random(in: 1..<24)
    var body: some View {
        ZStack {
            
                TabView(selection: $SelectedTag){
                    Timeline(editPostList: $B).environmentObject(self.userdata)
                        .tabItem{
                            Image(systemName: "house")
                        }.tag(1)
                    
                    Watch()
                        .tabItem{
                            Image(systemName : "tv")
                        }.tag(2)
                    Profile()
                        .tabItem{
                            Image(systemName:"person.crop.circle")
                        }.tag(3)
                    Notifications()
                        
                        .tabItem{
                            Image(systemName:"bell")
                        }.tag(4)
                    MoreList()
                        
                        .tabItem{
                            Image(systemName:"line.horizontal.3")
                        }.tag(5)
                    
                }.animation(.default)
            
            
            if userdata.showFullScreen || userdata.addPostFromProfile {
                DrapList()
                    .offset( y: ListPopUp ? 250:700)
                    .animation(.spring())
                    .gesture(
                        DragGesture()
                            .onChanged{ value in
                                self.dragPositon = value.translation
                                if dragPositon.height < 250 {
                                    ListPopUp.toggle()
                                }else if dragPositon.height > 150 {
                                    ListPopUp.toggle()
                                }
                            }
                            .onEnded{ value in
                            }

                    )

            }

        
            //====================== show story view ==============================
        ZStack{
            if userdata.showStory  {
                Color.black.ignoresSafeArea(.all)

                ZStack {
                    VStack {
                        ZStack{
                            Image(userdata.storyPhoto)
                                .resizable()
                                .frame(width: .infinity, height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .offset(y:150)
                            
                            HStack{
                                Image(userdata.logo)
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .padding(.leading)
                                HStack(alignment: .firstTextBaseline) {
                                    Text(verbatim: userdata.name)
                                        .bold()
                                        .foregroundColor(.white)
                                        .font(.custom("default", size: 19))
                                    Text("\(time)h")
                                        .foregroundColor(.white)
                                        .font(.custom("default", fixedSize: 12))

                                }

                                   Spacer()
                                ZStack {
                                    Button(action: {userdata.showStory=false}, label: {
                                        Image(systemName: "xmark")
                                            .padding(.trailing)
                                            .foregroundColor(.white)
                                    })
                                }
                                


                            }
                            .offset(x: 0, y: -200)

                            loader()
                                .offset(x: 0, y: -230)

                            
                        }.transition(.slide)
                        Spacer()
                    }
                }

            }
            
        }
            //====================== show story view ==============================

        
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserData())
    }
}
// this is the bar which located in the top of page
struct MyToolBar: View {
    @State var IsSearching = false
    var body: some View {
        HStack{
            Text(IsSearching ? "":"facebook")
                .font(.title)
                .bold()
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
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
                // here this is button is manage activate the search bar
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
                .foregroundColor(.black)
            }
            
            // here this is button if the search bar not activate it will apair
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
struct Commments:View{
    @State var likeCommment = false
    @State var text:String
    var body: some View{
        HStack(alignment: .top) {
            Image("fares")
                .resizable()
                .frame(width: 45 ,height: 45)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            VStack(alignment: .leading) {
                ZStack{
                    Rectangle()
                        .frame(width: 350, height: 60)
                        .foregroundColor(Color("FacebookGrayButton"))
                        .cornerRadius(20)
                    VStack(alignment: .leading) {
                        Text("Fares abukhader")
                            .bold()
                        Text(text)
//                            .frame(width: 150, height: 30)
                            .multilineTextAlignment(.center)
                            .lineLimit(3).lineSpacing(0)
//                            .padding()
                    }.padding(.trailing,180)
                    
                }.padding(.bottom,likeCommment ? 0:2)
                HStack{
                    Text("10w").padding(.trailing).padding(.leading).foregroundColor(.black).font(.custom("default", size: 13))
                    Button(action: {likeCommment.toggle()}, label: {
                        Text("Like").padding(.trailing).foregroundColor(likeCommment ? .red :.black).font(.custom("default", size: 13))
                    })
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Reply").foregroundColor(.black).font(.custom("default", size: 13))
                    })
                    if likeCommment{
                    Text("1").offset(x:120)
                    Image(systemName: "hand.thumbsup.fill").resizable().frame(width: 13, height: 13, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(.white)
                        .padding(5)
                        .background(Color(.blue))
                        .cornerRadius(16)
                        .offset(x:120)
                    }
                        
                }
            }
        }
    }
}
struct loader:View{
    @State var width:CGFloat = 100
    var time = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State var secs:CGFloat = 0
    @State var goBack = false
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
                userdata.showStory = false
                time.upstream.connect().cancel()
            }

           
        })
    }
}
