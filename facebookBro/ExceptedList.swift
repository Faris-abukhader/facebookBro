//
//  ExceptedList.swift
//  facebook
//
//  Created by admin on 2021/1/24.
//

import SwiftUI

struct ExceptedList: View {
    var body: some View {
        VStack{
            bar()
            Spacer()
            ScrollView(showsIndicators: false){
                ForEach(0..<20){_ in
                    listforexceptfriend()
                        .padding(.bottom)
                }
            }.animation(.default)
        }
    }
}

struct ExceptedList_Previews: PreviewProvider {
    static var previews: some View {
        ExceptedList()
    }
}
struct bar:View{
    @State var finish  = false
    var body: some View{
        VStack {
            HStack{
                ZStack {
                    Button(action: {finish.toggle()}, label: {
                        Image(systemName: "xmark")
                            .padding(.leading)
                            .padding(.top)
                            .foregroundColor(.black)

                    })
                    Button(action: {}, label: {}).fullScreenCover(isPresented: $finish, content: {
                        PostPrivacy()
                    })
                }
                Spacer()
                Text("Friends except...")
                    .font(.title3)
                    .padding(.top)
                Spacer()
                Button(action: {finish.toggle()}, label: {
                    Text("Done")
                        .padding(.trailing)
                        .padding(.top)
                })
            }
            TextField("    Search Facebook", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .frame(width: 360, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color(.white))
                .cornerRadius(10)
                .shadow(radius: 2)
                .padding(.vertical)
        }
    }
}
struct listforexceptfriend:View{
    @State var selectIt = false
    var body: some View{
        HStack{
            Image("fares")
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .padding(.leading)
            Text("Fares Abukahder")
            Spacer()
            Button(action: {selectIt.toggle()}, label: {
                ZStack {
                    Image(systemName:selectIt ? "square.fill" : "square")
                        .foregroundColor(selectIt ? .red : .black)
                        .padding(.trailing)
                    Image(systemName: "minus")
                        .resizable()
                        .frame(width: 6, height: 3)
                        .offset( x:-8)
                        .foregroundColor(.white)
                }
            }).animation(.default)
            
        }
    }
}
