//
//  EditProfile.swift
//  facebook
//
//  Created by admin on 2021/2/1.
//

import SwiftUI

struct EditProfile: View {
    var body: some View {
        VStack{
            editProfileToolbar()
            ScrollView{
                editProfileBody()
                editProfileBody2()
            }
        }
    }
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile()
    }
}
struct editProfileToolbar:View{
    @State var GoBack = false
    var body: some View{
        HStack{
            ZStack {
                Button(action: {GoBack.toggle()}, label: {
                    Image(systemName: "chevron.left")
                        .padding(.leading)
                        .foregroundColor(.black)
                })
                Button(action: {}, label: {}).fullScreenCover(isPresented: $GoBack, content: {
                    Profile()
                })
            }
            Spacer()
            Text("Edit Profile")
                .font(.title2)
            Spacer()
        }
    }
}
struct editProfileBody:View{
    @State var goToDetail = false
    var body: some View{
        VStack {
            HStack{
                Text("Profile Picture")
                    .bold()
                    .padding(.leading)
                    .font(.title2)
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Edit")
                        .padding(.trailing)
                })
            }
        
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
            Image("fares")
                .resizable()
                .frame(width: 140, height: 140, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            Rectangle()
                .frame(width: 400, height: 0.2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.top)
                .foregroundColor(.black)
      }
            HStack{
                Text("Cover Photo")
                    .bold()
                    .padding(.leading)
                    .font(.title2)
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Edit")
                        .padding(.trailing)
                })
            }
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                Image("Hangzhou")
                    .resizable()
                    .frame(width: 400, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                Rectangle()
                    .frame(width: 400, height: 0.2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.top)
                    .foregroundColor(.black)
          }
            HStack{
                Text("Bio")
                    .bold()
                    .padding(.leading)
                    .font(.title2)
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Edit")
                        .padding(.trailing)
                })
            }
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                Text("hello friends")
                    .padding(.top)
                Rectangle()
                    .frame(width: 400, height: 0.2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.black)
          }
            HStack{
                Text("Details")
                    .bold()
                    .padding(.leading)
                    .font(.title2)
                Spacer()
                Button(action: {goToDetail.toggle()}, label: {
                    Text("Edit")
                        .padding(.trailing)
                })
            }

            HeaderPartTwo()
                .padding(.top)
            Rectangle()
                .frame(width: 400, height: 0.2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.black)

            
    }
  }
}
struct editProfileBody2:View{
    @State var goToDetail = false
    var body: some View{
        VStack{
            HStack{
                Text("Hobbies")
                    .bold()
                    .padding(.leading)
                    .font(.title2)
                Spacer()
                ZStack {
                    Button(action: {}, label: {
                        Text("Add")
                            .padding(.trailing)
                    })
                    
                }
            }
            
                Rectangle()
                    .frame(width: 400, height: 0.3, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.black)

            HStack{
                Text("Featured")
                    .bold()
                    .padding(.leading)
                    .font(.title2)
                Spacer()
                ZStack {
                    Button(action: {}, label: {
                        Text("Add")
                            .padding(.trailing)
                    })
                    
                }
            }
            
            ZStack {
                Rectangle()
                    .frame(width: 80, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                    .offset(x:29,y:15)
                    .rotationEffect(.init(degrees: 140))
                    .foregroundColor(.gray)

                Rectangle()
                    .frame(width: 80, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                
                Rectangle()
                    .frame(width: 80, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                    .offset(x:40,y:-20)
                    .rotationEffect(.init(degrees: 40))
                    .foregroundColor(.blue)

            }
            
            Text("Feature some of your favorite stories,photos or videos to show friends more about you.")
                .multilineTextAlignment(.center)
                .frame(width: 380, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color(.darkGray))
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Try it")
                    .padding(.horizontal,150)
                    .padding(.vertical,10)
                    .background(Color("FacebookGrayButton"))
                    .cornerRadius(10)
                    .padding(.bottom)
                    
            })
            Rectangle()
                .frame(width: 400, height: 0.3, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.black)
        

            HStack{
                Text("Links")
                    .bold()
                    .padding(.leading)
                    .font(.title2)
                Spacer()
                ZStack {
                    Button(action: {}, label: {
                        Text("Add")
                            .padding(.trailing)
                    })
                    
                }
            }
            Rectangle()
                .frame(width: 400, height: 0.3, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.black)

            ZStack {
                Button(action: {goToDetail.toggle()}, label: {
                    Text("Edit your About info")
                        .padding(.horizontal,90)
                        .padding(.vertical,10)
                        .background(Color("FacebookGrayButton"))
                        .cornerRadius(10)
                        .padding(.bottom)
                        .padding(.top)
                        
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {}).fullScreenCover(isPresented: $goToDetail, content: {
                    profileAbout()
                })
            }



        }
    }
}
