//
//  moreGroup.swift
//  facebook
//
//  Created by admin on 2021/1/28.
//

import SwiftUI

struct moreGroup: View {
    @State var icons = ["group1","group2","group3"]
    @State var labelone = ["Suggested for You","Friends' Groups","Browse by Your Activity"]
    @State var labeltwo = ["Groups you might be interested in.","Groups your friends are in.","These groups are similar to others you've viewed."]
    @State var groupsName = ["Master Programming","Jordan Lover","Uae Skills"]
    var body: some View {
        VStack {
            MoregroupToolBar()
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false, content: {
                    VStack{
                    bodyForMorGroup(labelone: labelone[0], labeltwo: labeltwo[0])
                    firstGroup(label: groupsName[0],icon:icons[0])
                    Rectangle()
                        .frame(width: 400, height: 0.5)
                        .foregroundColor(Color(.lightGray))
                        .offset(x: 0, y: 30)
                        bodyForMorGroup(labelone: labelone[1], labeltwo: labeltwo[1])
                            .offset(x: 0, y: 30)
                        firstGroup(label: groupsName[1],icon:icons[1])
                            .offset(x: 0, y: 30)
                        Rectangle()
                            .frame(width: 400, height: 0.5)
                            .foregroundColor(Color(.lightGray))
                            .offset(x: 0, y: 60)
                        categories()
                            .offset(x: 0, y: 60)
                        Rectangle()
                            .frame(width: 400, height: 0.5)
                            .foregroundColor(Color(.lightGray))
                            .offset(x: 0, y: 70)
                        bodyForMorGroup(labelone: labelone[2], labeltwo: labeltwo[2])
                            .offset(x: 0, y: 60)
                        VStack{
                            firstGroup(label: groupsName[2],icon:icons[2])
                                .offset(x: 0, y: 60)

                        }

                    }
            })
        }
            
    }
}

struct moreGroup_Previews: PreviewProvider {
    static var previews: some View {
        moreGroup()
    }
}
struct MoregroupToolBar:View{
    @State var IsSearching = false
    @State var GoBackToTimeline = false
    var body: some View{
        VStack {
            HStack{
                ZStack {
                    Button(action: {GoBackToTimeline.toggle()}, label: {
                        Image(systemName: "chevron.left")
                            .padding(.leading)
                            .foregroundColor(.black)
                    })
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: { })
                        .fullScreenCover(isPresented: $GoBackToTimeline, content: {
                            ContentView()
                        })
                }
                Spacer()
                Text(IsSearching ? "":"Discover")
                    .font(.title2)
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
                    }).offset(x: IsSearching ? -235:-10, y: 0)
                    .foregroundColor(.black)
                }
                
            }.offset(x: IsSearching ? 10:0, y: 0)
            Rectangle()
                .frame(width: .infinity, height: 0.5)
                .foregroundColor(Color(.lightGray))
                .offset(x: 0, y: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
        }

    }
}
struct bodyForMorGroup:View{
    @State var labelone:String
    @State var labeltwo:String
    @State var goToSeeAll = false
    var body: some View{
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text(labelone)
                        .bold()
                        .font(.title2)
                    Text(labeltwo)
                        .font(.footnote)
                        .padding(.top,-5)
                }.padding(.leading)
                Spacer()
                ZStack {
                    Button(action: {goToSeeAll.toggle()}, label: {
                        Text("See All")
                            .padding(.trailing)
                    })
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {}).fullScreenCover(isPresented: $goToSeeAll, content: {
                        allGroups()
                    })
                }
            }.padding(.top)

        }
    }
}
struct firstGroup:View{
    @State var label:String
    @State var icon:String
    var body: some View{
        VStack {
            ZStack {
                Image(icon)
                    .resizable()
                    .frame(width: 400, height: 180, alignment: .center)
                    .cornerRadius(10)
                    .shadow(radius: 1)
                Rectangle()
                    .cornerRadius(10)
                    .frame(width: 400, height: 120, alignment: .center)
                    .offset(x: 0, y: 150)
                    .foregroundColor(.white)
                    .shadow(radius: 1)
                Rectangle()
                    .frame(width: 400, height: 15, alignment: .center)
                    .offset(x: 0, y: 90)
                    .foregroundColor(.white)
            }
            
            VStack(alignment:.leading) {
                Text(label)
                    .font(.title3)
                //                        .offset(x:-100,y:100)
                Text("12M members . 5K posts a day")
                    .font(.footnote)
                    .foregroundColor(Color(.darkGray))
                //                        .offset(x:-95,y:130)
                Button(action: {}, label: {
                    Text("Join Group")
                        .padding(.horizontal,150)
                        .padding(.vertical,10)
                        .background(Color("FacebookGrayButton"))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                })
                //                    .offset(x:0,y:170)
            }
            
            groups()
                .offset(x: 0, y: 25)
            
            //            }
//                .offset(x: 0, y: 120)
        }
//        .offset(x: 0, y: 0)

    }
}
struct groups:View{
    @State var icons = ["gl1","gl2","gl3","gl4","gl5","gl6","gl7","gl8","gl9"]
    @State var label = ["Googler","MR BEAST","ASTRONOMY LOVER","expat in china","Swiftui","Python","Animals Lover","Students in china","ABU SRWAL"]
    @State var memebersNum = ["6M members 100K psots a week","6K members 100 psots a week","30K members 1K psots a week","644K members 2K psots a week","4K members 20 psots a week","200K members 300 psots a day","1M members 2K psots a day","150K members 200 psots a day","6M members 3K psots a day"]
    var body: some View{
        ForEach(0..<9) { i in
            VStack {
                HStack{
                    Image(icons[i])
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(10)
                        .padding(.leading)
                    VStack(alignment: .leading){
                        Text(label[i])
                        Text(memebersNum[i])
                            .font(.footnote)
                            .foregroundColor(Color(.darkGray))
                    }
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Join")
                            .padding(10)
                            .background(Color("FacebookGrayButton"))
                            .cornerRadius(10)
                            .foregroundColor(Color(.darkGray))
                            .padding(.trailing)
                    })
                }
            }
        }
    }
}
struct categories:View{
    @State var categories = ["Humor","Science & Tech","Travel","Buy & Sell","Business","Style","Health","Animals"]
    @State var icons = ["moreG1","moreG2","moreG3","moreG4","moreG5","moreG6","moreG7","moreG8"]
    @State var gotoAllCatog = false
    var body: some View{
        VStack(alignment:.leading){
            HStack{
                VStack(alignment: .leading) {
                    Text("Catogeries")
                        .font(.title2)
                        .padding(.bottom,5)
                    Text("Find a group by browsing top categories.")
                        .font(.footnote)
                        .foregroundColor(Color(.darkGray))
                }
                .padding(.leading)
                Spacer()
                ZStack {
                    Button(action: {gotoAllCatog.toggle()}, label: {
                        Text("See All")
                            .padding(.trailing)
                    })
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {}).fullScreenCover(isPresented: $gotoAllCatog, content: {
                        allCatogeries()
                    })
                }
            }
//            HStack{
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(0..<6){ i in
                        catogeriesIcons(icons: icons[i], label: categories[i])
                    
//                    .offset(x: -140, y: 0)
                        }
                }
            }.offset(x: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/, y: 0)
//            .offset(x: 20, y: 80)
//            }
            
        }
    }
}
struct catogeriesIcons:View{
    @State var icons:String
    @State var label:String
    var body: some View{
        ZStack {
            Image(icons)
                .resizable()
                .frame(width: 170, height: 170)
                .cornerRadius(10)
            VStack(alignment:.leading) {
                Text(label)
                    .bold()
                    .frame(width: 140, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,4)
                    .background(Color.white)
                    .cornerRadius(10)
                    .offset(x: -18, y: 60)
            }

        }
    }
}
