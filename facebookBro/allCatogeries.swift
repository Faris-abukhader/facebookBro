//
//  allCatogeries.swift
//  facebook
//
//  Created by admin on 2021/1/29.
//

import SwiftUI

struct allCatogeries: View {
    @State var categories1 = ["Humor","Travel","Business","Health","Sport&Fitness","Arts","Faith&Spirituality","Parenting","Food&Drink"]
    @State var categories2 = ["Science & Tech","Style","Buy & Sell","Animals","Education","Entertainment","Reationships&Identity","Hobbies&Interests","Vehicles&Commutes"]
    @State var icons1 = ["moreG1","moreG3","moreG5","moreG7","moreG9","moreG11","moreG13","moreG15","moreG17"]
    @State var icons2 = ["moreG2","moreG4","moreG6","moreG8","moreG10","moreG12","moreG14","moreG16","moreG18"]
    var body: some View {
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false) {
            VStack{
                allCatogeriesToolbar()
                ForEach(0..<9){ i in
                    HStack {
                        Spacer()
                        Button(action: {}, label: {
                            catog(icon: icons1[i], label: categories1[i])
                                .foregroundColor(.black)
                        })
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            catog(icon: icons2[i], label: categories2[i])
                                .foregroundColor(.black)
                        })
                        Spacer()
                    }
                }
            }
        }
    }
}

struct allCatogeries_Previews: PreviewProvider {
    static var previews: some View {
        allCatogeries()
    }
}
struct catog:View{
//    @State var categories = ["Humor","Science & Tech","Travel","Buy & Sell","Business","Style","Health","Animals","Sport&Fitness","Education","Arts","Entertainment","Faith&Spirituality","Reationships&Identity","Parenting","Hobbies&Interests","Food&Drink","Vehicles&Commutes","Civics&Community"]
//    @State var icons = ["moreG1","moreG2","moreG3","moreG4","moreG5","moreG6","moreG7","moreG8","moreG9","moreG10","moreG11","moreG12","moreG813","moreG14","moreG15","moreG16","moreG17","moreG18","moreG19"]
    @State var icon:String
    @State var label:String
    var body: some View{
        ZStack{
            Image(icon)
                .resizable()
                .frame(width: 190, height: 190)
                .cornerRadius(10)
                .opacity(0.8)
            Text(label)
                .offset(x: -40, y: 50)
                .frame(width: 110, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                .shadow(color: .white, radius: 1)
                
                
        }
    }
}
struct allCatogeriesToolbar:View{
    @State var GoBack = false
    var body: some View{
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
            
        }
        
    }
}
