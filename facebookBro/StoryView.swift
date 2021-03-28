//
//  StoryView.swift
//  facebookBro
//
//  Created by admin on 2021/2/3.
//

import SwiftUI

struct StoryView: View {
    @State var goBack = false
    @State var image:String
    @State var logo:String
    @State var name:String
    var time = Int.random(in: 1..<24)
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Image(image)
                .resizable()
                .frame(width: .infinity, height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {}).fullScreenCover(isPresented: $goBack, content: {
                ContentView()
            }).transition(.slide)
            
            HStack{
                Image(logo)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding(.leading)
                HStack(alignment: .firstTextBaseline) {
                    Text(name)
                        .bold()
                        .foregroundColor(.white)
                        .font(.custom("default", size: 19))
                    Text("\(time)h")
                        .foregroundColor(.white)
                        .font(.custom("default", fixedSize: 12))

                }

                   Spacer()
                ZStack {
                    Button(action: {goBack.toggle()}, label: {
                        Image(systemName: "xmark")
                            .padding(.trailing)
                            .foregroundColor(.white)
                    })
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: { }).fullScreenCover(isPresented: $goBack, content: {
                        ContentView()
                    })
                }
                


            }
            .offset(x: 0, y: -340)

            loader()
                .offset(x: 0, y: -370)

            
        }.transition(.slide)
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(image: "",logo:"",name:"")
    }
}
