//
//  TestView.swift
//  facebookBro
//
//  Created by admin on 2021/2/4.
//

import SwiftUI

struct TestView: View {
    @State var Go = false
    var profile = "fares"
    var name = "fares raed"
    var PostText = "hello from post"
    var imagess = "fares"
    var Like = false
    var time = 4
    var body: some View {
        ZStack {
            VStack (alignment: .leading){
                HStack{
                    
                    Image(profile)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                        .padding(.leading,15)
                    
                    VStack(alignment: .leading) {
                        Text(name)
                            .bold()
                        HStack{
                            Text("\(time) mins ago")
                                .foregroundColor(Color(.lightGray))
                                .font(.caption)
                            Image(systemName: "globe")
                                .resizable()
                                .frame(width: 10, height: 10)
                                .foregroundColor(Color(.lightGray))
                            
                            HStack{
                                Spacer()
                                Button(action: {}, label: {
                                    Image(systemName: "ellipsis")
                                        .foregroundColor(.gray)
                                        .padding(.horizontal)
                                        .offset(x: 0, y: -25)
                                })
                            }
                        }.padding(.top,-5)
                    }
                }
                .padding(.top)
                VStack(alignment: .leading) {
                    Text(PostText)
                        .padding(.leading)
                    if !imagess.isEmpty {
                        Image(imagess)
                            .resizable()
                            .frame(width: imagess.isEmpty ? 0:428, height:imagess.isEmpty ? 0: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                }
                    .padding(.top)
            
                
                
                
                Rectangle()
                    .frame(width: 400, height: 0.3, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(.lightGray))
                    .offset(x: 14)
                
                HStack{
                    Button(action: {}, label: {
                        Image(systemName:Like ? "hand.thumbsup.fill":"hand.thumbsup").padding(.leading,30)
                            .foregroundColor(Like ? .red:.black)
                        Text("Like")
                            .foregroundColor(.black)
                        
                    })
                    
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "bubble.left").foregroundColor(.black)
                        Text("Comment").foregroundColor(.black)
                    })
                    Spacer()
                    Button(action: {}, label: {
                        Image("share")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("share").padding(.trailing,30).foregroundColor(.black)
                        
                    })
                    
                }
                Rectangle()
                    .frame(width: 400, height: 0.3, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(.lightGray))
                    .offset(x: 14)
                    .padding(.bottom)
                
                    }
                }
                
                
                
            }
            
            
            
           //=======================//itemforlisteditpost========================================
            
            //=======================//itemforlisteditpost========================================
            
            
        
    
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
