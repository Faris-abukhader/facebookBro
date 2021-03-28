//
//  SeeAllView.swift
//  facebook
//
//  Created by admin on 2021/1/23.
//

import SwiftUI

struct SeeAllView: View {
    var labels = [ "yahya abukahlil","Issa Mohmmad","Isono Sugguru","Abu Fares","Obada Abukhadir","Um fares"]
    var OnlLineImage = ["Fone","Ftwo","Fthree","Ffour","Ffife","Fsix"]
    var body: some View {
        VStack {
            Suggestions()
            Spacer()
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false, content: {
                HStack {
                    Text("People You May Know")
                        .font(.title3)
                        .bold()
                        .padding(.leading)
                        .padding(.top)
                    Spacer()
                }
                VStack{
                    ForEach(0..<labels.count){ s in
                        NewPeopleSungget(image: OnlLineImage[s], name: labels[s])
                    }

                        ForEach(0..<labels.count){ s in
                        NewPeopleSungget(image: OnlLineImage[s], name: labels[s])
                    }
                }
                
            })
        }
    }
}

struct SeeAllView_Previews: PreviewProvider {
    static var previews: some View {
        SeeAllView()
    }
}
struct Suggestions:View{
    @State var IsSearching = false
    @State var GGoback = false
    @State var IntToView = 1
    var body: some View{
        HStack{
            Button(action: {
                GGoback.toggle()
            }, label: {
                Image(systemName:"chevron.left")
                    .resizable()
                    .frame(width: IsSearching ? 10:10, height: IsSearching ? 15:14)
                    .padding(8)
                    .padding(.leading,IsSearching ? 5:0)
                    .background(Color(IsSearching ?.lightText:.lightText))
                    .cornerRadius(50)
                    .padding(.leading)
            })
            .foregroundColor(.black)
            Spacer()
            Text(IsSearching ? "":"Sugestoins")
            .font(.title2)
                .foregroundColor(.black)
            .padding()
            Spacer()
            ZStack{
                if IsSearching {
                    TextField("    Search Facebook", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .frame(width: 340, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color(.white))
                        .cornerRadius(20)
                        .shadow(radius: 2)
                        .offset(x: -30, y: 0)
                        .padding(.vertical)
                        
                        
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {}).fullScreenCover(isPresented: $GGoback, content: {
                    ContentView()
                })
               
            }
            
            if !IsSearching {
                Button(action: {
                    IsSearching.toggle()
                }, label: {
                    ZStack {
                        Image(systemName:"magnifyingglass")
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
struct NewPeopleSungget:View{
    @State var image:String
    @State var name:String
    @State var show = true
    var num = Int.random(in: 20..<40)
    var body: some View{
        if show {
            HStack{
                    Image(image)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .padding()
                    VStack(alignment:.leading) {
                        Text(name)
                        Text("\(num) mutual friends")
                            .font(.caption)
                            .padding(.bottom,5)
                        HStack{
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("Add Friend")
                                    .foregroundColor(.white)
                                    .padding(.horizontal,40)
                                    .padding(.vertical,5)
                                    .background(Color("addFriendBlueButton"))
                                    .cornerRadius(3)
                                    .font(.caption2)
                            })
                            Button(action: {show.toggle()}, label: {
                                Text("Remove")
                                    .padding(.horizontal,40)
                                    .padding(.vertical,5)
                                    .background(Color("FacebookGrayButton"))
                                    .cornerRadius(3)
                                    .font(.caption2)
                                    .foregroundColor(.black)


                            })

                        }
                    }
                    Spacer()
            }
        }
        }
    }

