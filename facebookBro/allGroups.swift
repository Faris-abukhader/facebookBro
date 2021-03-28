//
//  allGroups.swift
//  facebook
//
//  Created by admin on 2021/1/28.
//

import SwiftUI

struct allGroups: View {
    @State var searchLogoIndex = Int.random(in: 1..<9)
    @State var icons = ["gl1","gl2","gl3","gl4","gl5","gl6","gl7","gl8","gl9"]
    @State var label = ["Googler","MR BEAST","ASTRONOMY LOVER","expat in china","Swiftui","Python","Animals Lover","Students in china","ABU SRWAL"]
    @State var memebersNum = ["6M members 100K psots a week","6K members 100 psots a week","30K members 1K psots a week","644K members 2K psots a week","4K members 20 psots a week","200K members 300 psots a day","1M members 2K psots a day","150K members 200 psots a day","6M members 3K psots a day"]
    var body: some View {
        VStack{
                allGroupsToolbar()
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
                VStack(alignment: .leading) {
                    ForEach(0..<9){ i in
                        Groups(icon: icons[i], label: label[i], memberNum: memebersNum[i])
                    }
                    ForEach(0..<9){ i in
                        Groups(icon: icons[i], label: label[i], memberNum: memebersNum[i])
                    }
                    ForEach(0..<9){ i in
                        if i == searchLogoIndex {
                            searchGroups()
                                .padding(.leading)
                                .padding(.vertical)

                        }
                        Groups(icon: icons[i], label: label[i], memberNum: memebersNum[i])
                    }
                    ForEach(0..<9){ i in
                        Groups(icon: icons[i], label: label[i], memberNum: memebersNum[i])
                    }

                }
            }
            .padding(.top)
            
        }
    }
}

struct allGroups_Previews: PreviewProvider {
    static var previews: some View {
        allGroups()
    }
}
struct allGroupsToolbar:View{
    @State var GoBack = false
    var body: some View{
        VStack {
            HStack{
                ZStack {
                    Button(action: {
                        GoBack.toggle()
                    }, label: {
                        Image(systemName:"chevron.left")
                            .resizable()
                            .frame(width:10,height:15)
                            .padding(8)
                            .background(Color(.lightText))
                            .cornerRadius(50)
                            .foregroundColor(.black)
                })
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {}).fullScreenCover(isPresented: $GoBack, content: {
                        moreGroup()
                    })
                }
                
                TextField("    Search Facebook", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .frame(width: 360, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color(.white))
                    .cornerRadius(20)
                    .shadow(radius: 2)
                    .padding(.vertical)
                    .padding(.bottom,-20)
                
            }
            Rectangle()
                .frame(width: .infinity, height: 0.5)
                .foregroundColor(Color(.lightGray))
                .offset(x: 0, y: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)

        }
        
    }
}
struct Groups:View{
    @State var icon:String
    @State var label:String
    @State var memberNum:String
    var body: some View{
        HStack{
            Image(icon)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
                .padding(.leading)
            VStack(alignment: .leading) {
                Text(label)
                Text(memberNum)
                    .font(.footnote)
                    .foregroundColor(Color(.darkGray))
            }
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Join")
                    .padding(12)
                    .background(Color("FacebookGrayButton"))
                    .cornerRadius(10)
                    .padding(.trailing)
            })
        }
    }
}
struct searchGroups:View{
    var body: some View{
        ZStack{
            Rectangle()
                .frame(width: 400, height: 250)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 1)
            VStack{
                Image(systemName: "magnifyingglass.circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color(.darkGray))
                    .padding(.top,-30)
                Text("Not finding what you're looking for?")
                    .font(.title3)
                Text("Use keywords to Search.")
                    .font(.footnote)
                    .padding(.bottom,10)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Search Groups")
                        .padding(.vertical,15)
                        .padding(.horizontal,100)
                        .background(Color("FacebookGrayButton"))
                        .foregroundColor(.black)
                        .cornerRadius(5)
                })
            }
        }
    }
}
