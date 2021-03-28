//
//  profileAbout.swift
//  facebook
//
//  Created by admin on 2021/2/1.
//

import SwiftUI
class work:Identifiable,ObservableObject{
    var id = UUID()
    @State var name = ""
}
class std:Identifiable,ObservableObject{
    var id = UUID()
    @Published var name=""
    var students = [work()]
}
struct profileAbout: View {
    @State var works:[String]=[]
    @State var work:String = ""
    @State var index = 0
    @ObservedObject var newWork = std()
    var body: some View {
        VStack{
            aboutToolbar()
            ScrollView {
                VStack {
                    HStack{
                     Text("Work")
                        .font(.title2)
                        .bold()
                        .padding(.leading)
                        Spacer()
                        
                    }
                    HStack{
                        TextField("Your work", text: self.$work)
                                .padding(10)
                                .background(Color("FacebookGrayButton"))
                                .frame(width: 360, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(10)
                        Button(action: {index+=1}, label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color.black)
                        })
                    }
                    HStack{
                     Text("Education")
                        .font(.title2)
                        .bold()
                        .padding(.leading)
                        Spacer()
                        
                    }
                    HStack{
                        TextField("Your work", text: self.$work)
                                .padding(10)
                                .background(Color("FacebookGrayButton"))
                                .frame(width: 360, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(10)
                        Button(action: {index+=1}, label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color.black)
                        })
                    }
                    HStack{
                     Text("Places Lived")
                        .font(.title2)
                        .bold()
                        .padding(.leading)
                        Spacer()
                        
                    }
                    HStack{
                        TextField("Your work", text: self.$work)
                                .padding(10)
                                .background(Color("FacebookGrayButton"))
                                .frame(width: 360, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(10)
                        Button(action: {index+=1}, label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color.black)
                        })
                    }

                    HStack{
                     Text("Contact info")
                        .font(.title2)
                        .bold()
                        .padding(.leading)
                        Spacer()
                        
                    }
                    HStack{
                        TextField("Your work", text: self.$work)
                                .padding(10)
                                .background(Color("FacebookGrayButton"))
                                .frame(width: 360, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(10)
                        Button(action: {index+=1}, label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color.black)
                        })
                    }

                        
                }.padding(.top)
            }
        }
      }
    }

struct profileAbout_Previews: PreviewProvider {
    static var previews: some View {
        profileAbout()
    }
}
struct aboutToolbar:View{
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
            Text("About")
                .font(.title2)
            Spacer()
        }
    }
}
