//  MoreList.swift
//  facebook
//  Created by admin on 2020/12/31.
import SwiftUI

struct MoreList: View {
   @State var Icons = ["person.2.fill","person.3.fill","tv.fill","hexagon.fill","chart.bar.doc.horizontal","briefcase.fill","clock.arrow.circlepath","flag.fill","rectangle.fill"]
    @State  var labels:[String] = ["Friends","Groups","Watch","Saved","Events","Jobs","Memories","Pages","Gaming"]
    @State var boolean:[Bool] = [true,false,true,false,false,false,true,false,false]
    @State var requests:[String] = ["1 request","","9+ new Videos","","","","4 memories","","",""]
     var color:[Color] = [Color.blue,Color.blue,Color.blue,Color.purple,Color.red,Color.orange,Color.blue,Color.orange,Color.blue]
    @State var List:[String] = ["Avatars","Campus","Device Requests","Facebook Pay","Find Wi-Fi","Live Videos","Mentorship","Most Recent","Offers","Recent Ad Actvity","Weather"]
    @State var ListIcoin:[String] = ["face.smiling.fill","paperplane.fill","iphone.homebutton","creditcard.fill","wifi","live","mountain","calendar","sale","activity","cloud.sun.fill"]
    @State var helpListElements = ["Help Center","Support Inbox","Report a Problem","Terms & Policies"]
    @State var helpListIcon = ["circles.hexagonpath","newspaper.fill","questionmark.diamond.fill","exclamationmark.bubble.fill"]
    @State var settingListElements = ["Settings","Privacy Shortcut","Your Time on Facebook","Dark Mode","App Language"]
    @State var settingLsitIcon = ["person.crop.circle","lock","clock","moon.stars.fill","globe"]
//    @State var MoreLessIcon = false
//    @State var MoreLessIcon1 = false
//    @State var MoreLessIcon2 = false
    @State var IsLength:[Bool] = [true,true,false,false,true,true,true,false,true,false,true]
    @State var goToProfile = false
    @EnvironmentObject var userdata:UserData
    var body: some View {
//                ZStack {
                    ScrollView(showsIndicators: false) {
                            VStack {
                            MenuBar().padding(.leading)
                                .padding(.bottom)
                            seeProfile()
                                .padding(.leading,10)
                                .onTapGesture {
                                goToProfile.toggle()
                            }
                                .fullScreenCover(isPresented: $goToProfile, content: {
                                    Profile()
                                })

                            HStack(spacing: 10){
                                VStack{
                                    MainList()
                                        .padding(.bottom,10)
                                    ForEach(6..<9){ d in
                                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                            SubListElements( Icons: Icons[d], requests: requests[d],label: labels[d],boolean: boolean[d])
                                        })
                                        .foregroundColor(.black)
                                    }
                                }.offset(x: 0, y: -50)
                                VStack{
                                    ForEach(0..<6){ d in
                                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                            SubListElements( Icons: Icons[d], requests: requests[d],label: labels[d],boolean: boolean[d])
                                                
                                        })
                                        .foregroundColor(.black)
                                    }
                                }
                            }
                                
                                SeeMore()
                                .padding(.top)
                                .onTapGesture{
                                    userdata.showList1.toggle()
                                }
                            
                                    if userdata.showList1 {
                                        ForEach(0..<11){ s in
                                            if (s == 5 || s == 6 || s==8 || s==9){
                                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                                    ListITemplus(label: List[s], icon: ListIcoin[s])
                                                })
                                                .foregroundColor(.black)
                                            }
                                            else{
                                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                                    ListItem(label: List[s], icon: ListIcoin[s])
                                                })
                                                .foregroundColor(.black)
                                            }

                                        }
                                    }

                                
                            ///////////////////////////////////////////////////////////-------------------------------------------------------
                                lists()
                                    .padding(.top)
                                    .onTapGesture{
                                        userdata.showList2.toggle()
                                    }
                                    if userdata.showList2 {
                                        ForEach(0..<helpListElements.count){ s in
                                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                                    ListItem(label: helpListElements[s], icon: helpListIcon[s])
                                                })
                                                .foregroundColor(.black)
                                            }

                                        }
                                    
                                    
                                

                                lists1()
                                    .padding(.top)
                                    .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                                        userdata.showList3.toggle()
                                    })
                                
                                    if userdata.showList3 {
                                        ForEach(0..<helpListElements.count){ s in
                                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                                    ListItem(label: settingListElements[s], icon: settingLsitIcon[s])
                                                })
                                                .foregroundColor(.black)
                                            }

                                        }
                                    


                                
                                
                            }
                        }
//                    }
                }
            }


struct MoreList_Previews: PreviewProvider {
    static var previews: some View {
        MoreList()
    }
}
struct MainList:View{
    var body: some View{
        ZStack{
            Image("gl9")
                .resizable()
                .frame(width: 180, height: 200, alignment: .center)
                .cornerRadius(10)
                .shadow(radius: 1)
            Rectangle()
                .frame(width: 180, height: 90)
                .cornerRadius(10)
                .offset(x: 0, y: 60)
                .shadow(radius: 1)
                .foregroundColor(Color(.white))
            Rectangle()
                .frame(width: 180, height: 10)
                .offset(x: 0, y: 20)
                .foregroundColor(Color(.white))
            Image(systemName: "play.fill")
                .foregroundColor(.white)
                .padding(10)
                .background(Color(.lightGray))
                .cornerRadius(30)
                .offset(x: 0, y: -30)
                .opacity(0.7)
            Text("10:05")
                .font(.caption2)
                .padding(3)
                .background(Color(.lightGray))
                .cornerRadius(5)
                .offset(x: 65, y: 0)
                .opacity(0.8)
            VStack(alignment: .leading){
                Text("Continue Watching")
                    .font(.caption2)
                    .foregroundColor(Color(.darkGray))
                Text(" تحدي ببجي بدون اضافات ؟")
                    .font(.caption)
                    HStack{
                        Image("gl9")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        Text("Abu serwal")
                            .font(.caption2)
                        Image("check")
                            .resizable()
                            .frame(width: 10, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                    }
            }
            .offset(x: -20, y: 60)
        }
    }
}
struct SubListElements:View{
    @State var Icons:String
    @State var requests:String
    @State var label:String
    @State var boolean:Bool

    var body: some View{
        ZStack(alignment: .leading){
            Rectangle()
                .frame(width: 180, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)
                .shadow(radius: 2)
                .foregroundColor(.white)
            
            VStack(alignment: .leading){
      
                Image(systemName: Icons)
                    .foregroundColor(Color.blue)
                    .padding(.bottom,10)
                Text(label)
                    .bold()
                HStack{
                    if boolean{
                        Image( systemName:  "circle.fill")
                          .resizable()
                          .frame(width: 10, height: 10)
                          .foregroundColor( Color.red)
                    }
                        Text(requests)
                            .font(.caption2)
                            .foregroundColor(Color(.darkGray))
                }
                
            }
            .padding(.leading)
        }
    }
    
}
struct MenuBar: View {
    @State var IsSearching = false
    var body: some View {
        HStack{
            Text(IsSearching ? "":"Menu")
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
                }).offset(x: IsSearching ? -235:-10, y: 0)
                .foregroundColor(.black)
               
            }
            
        }.offset(x: IsSearching ? 10:0, y: 0)
    }
}
struct seeProfile:View{
    var body:some View{
        ZStack {
            HStack{
                Image("fares")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding(.leading)
                VStack(alignment: .leading){
                    Text("Fares Abukhader")
                    Text("See your profile")
                        .font(.caption)
                }

                Spacer()
            }
            .padding(.bottom)
        }
    }
}
struct SeeMore:View{
    @EnvironmentObject var userdata:UserData
    var body: some View{
        HStack {
         
            VStack{
                HStack{
                    Image(systemName: "app.fill")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .padding(.trailing,-4)
                        .foregroundColor(.blue)
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.yellow)
                }.padding(.bottom,-4)
                .padding(.leading)
                HStack{
                    Image(systemName: "triangle.fill")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .padding(.trailing,-4)
                        .foregroundColor(.green)
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.red)
                }.padding(.leading)

            }
          
            
            Text(userdata.showList1 ? "See Less":"See All")
                .padding(.leading,10)
            
            Spacer()
            Button(action: {
                userdata.showList1.toggle()
            }, label: {
                Image(systemName: userdata.showList1 ? "chevron.up" :"chevron.down")
                    .padding(.trailing)
                    .foregroundColor(.black)
            })
           
        }

    }
}
struct lists:View{
    @EnvironmentObject var userdata:UserData
    var body: some View{
        HStack {
         
            Image(systemName: "questionmark.circle.fill")
                .resizable()
                .frame(width: 25, height: 25)
                .padding(.leading)
            
            Text("Help & Support")
                .padding(.leading,10)
            
            Spacer()
            Button(action: {
                userdata.showList2.toggle()
            }, label: {
                Image(systemName:  userdata.showList2 ? "chevron.up" :"chevron.down")
                    .padding(.trailing)
                    .foregroundColor(.black)
            })
           
        }

    }
}
struct lists1:View{
    @EnvironmentObject var userdata:UserData
    var body: some View{
        HStack {
         
            Image(systemName: "pencil.circle")
                .resizable()
                .frame(width: 25, height: 25)
                .padding(.leading)
            
            Text("Settings & Privacy")
                .padding(.leading,10)
            
            Spacer()
            Button(action: {
                userdata.showList3.toggle()
            }, label: {
                Image(systemName: userdata.showList3 ? "chevron.up" :"chevron.down")
                    .padding(.trailing)
                    .foregroundColor(.black)
            })
           
        }

    }
}


struct ListItem:View{
    @State var label:String
    @State var icon:String
    var body: some View{
        ZStack(alignment: .leading){
            Rectangle()
                .frame(width: 400, height: 60)
                .cornerRadius(10)
                .foregroundColor(.white)
                .shadow(radius: 2)
            ZStack(alignment: .leading){
                    HStack {
                        Image(systemName: icon)
                            .offset(x: 0, y: 0)
                    }
                    HStack {
                        Text(label)
                            .offset(x: 30, y: 0)
                    }
                        
            }.padding(.leading)
        }
    }
}
struct ListITemplus:View{
    @State var label:String
    @State var icon:String
    var body: some View{
        ZStack(alignment: .leading){
            Rectangle()
                .frame(width: 400, height: 60)
                .cornerRadius(10)
                .foregroundColor(.white)
                .shadow(radius: 2)
            ZStack(alignment: .leading){
                    HStack {
                        Image( icon)
                            .offset(x: 0, y: 0)
                    }
                    HStack {
                        Text(label)
                            .offset(x: 30, y: 0)
                    }
                        
            }.padding(.leading)
        }
       
    }
}

struct activtyItem:View{
    var body: some View{
        ZStack{
            Rectangle()
                .frame(width: 400, height: 60)
                .cornerRadius(10)
                .foregroundColor(.white)
                .shadow(radius: 2)
                ZStack{
                    HStack {
                        Image( "activity")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .offset(x: -60, y: 0)
                    }
                    HStack {
                        Text("Recent Ad Activity ")
                            .offset(x: 30, y: 0)
                    }
                        
                }.offset(x: -110, y: 0)
        }
       
    }
}
