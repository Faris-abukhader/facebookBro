//
//  Profile.swift
//  facebook
//
//  Created by admin on 2020/12/28.
//

import SwiftUI

struct Profile: View {
    @State var images=["food1","food2","food3","food4","food5","food6","food7","food8","food9","food10"]
    @State var postText = ["Hello Friends","Lovely Pic","Food Lover hh","Live Before I eat it","no food no life","here we go","oh god i can't","After long day of fasting finaly...","come on baby","busmullah"]
    @State var OnlLineImage = ["Fone","Ftwo","Fthree","Ffour","Ffife","Fsix","Fone","Ftwo","Fthree","Ffour","Ffife","Fsix","Fone","Ftwo","Fthree","Ffour"]
    @EnvironmentObject var userdata:UserData
    @State var text = " "
    @State var GoToPrivacy = false
    @State var postNum = 10
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                    ProfileBar()
                    profileHeader()
                    updateProfileSuggest()
                        .padding(.bottom)
                    HeaderPartTwo()
                    Friends()
                
                    AddPostes()
                        .padding(.top,30)
                ForEach((0..<postText.count).reversed(),id:\.self){ s in
                    Postes(imagess: images[s], PostText: postText[s],profile: "fares",name:"Fares Abukhader")
                    
                }
            }
            
            // ==================add Post View ===================

            ZStack{
                if userdata.addPostFromProfile {
                    Color.white.ignoresSafeArea(.all)
                    ZStack {
                        VStack {
                            HStack{ // Create Post Header
                                Button(action: {
                                    self.userdata.addPostFromProfile = false
                                }, label: {
                                    Image(systemName: "xmark")
                                        .frame(width: 25, height: 25)
                                        .padding(.leading)
                                        .foregroundColor(.black)
                                })
                               
                                Spacer()
                                Text("Create Post")
                                Spacer()
                                Button(action: {
                                    if !text.isEmpty {
                                    postText.append(text)
                                    images.append("")
                                    postNum=postText.count
                                    userdata.addPostFromProfile = false
                                    text = ""
                                  }
                                }, label: {
                                    Text("Post")
                                        .foregroundColor(.black)
                                })
                                .padding(.trailing)
                            }
                            
                            VStack(alignment: .leading) {
                                HStack{
                                   Image("fares")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    VStack(alignment: .leading){
                                        Text("Fares Abuhader")
                                            .padding(.bottom,5)
                                        HStack{
                                            ZStack {
                                                Rectangle()
                                                    .stroke()
                                                    .frame(width: 60, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                    .cornerRadius(1)
                                                Image(systemName: "globe")
                                                    .resizable()
                                                    .frame(width: 10, height: 10)
                                                    .offset(x: -20, y: 0)
                                                Text("Public")
                                                    .font(.custom("bold", size: 10))
                                                    .offset(x: 3, y: 0)
                                                Image(systemName: "arrowtriangle.down.fill")
                                                    .resizable()
                                                    .frame(width: 5, height: 5)
                                                    .offset(x: 23, y: 0)
                                            }.onTapGesture {
                                                GoToPrivacy.toggle()
                                            }
                                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {}).fullScreenCover(isPresented: $GoToPrivacy, content: {
                                                PostPrivacy()
                                            })
                                            ZStack {
                                                Rectangle()
                                                    .stroke()
                                                    .frame(width: 60, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                    .cornerRadius(1)
                                                Image(systemName: "plus")
                                                    .resizable()
                                                    .frame(width: 10, height: 10)
                                                    .offset(x: -20, y: 0)
                                                Text("Album")
                                                    .font(.custom("bold", size: 10))
                                                    .offset(x: 3, y: 0)
                                                Image(systemName: "arrowtriangle.down.fill")
                                                    .resizable()
                                                    .frame(width: 5, height: 5)
                                                    .offset(x: 23, y: 0)
                                            }.padding(.leading,5)
                                            
                                        }
                                    }
                                }
                                TextField("What's on your mind?", text: $text)
                                    .frame(width: 400, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding(.top)
                                   
                            }

                        Spacer()
                        }

                        // ==================add Post View ===================


                    }
                }
            }
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}

struct ProfileBar: View {
    @State var IsSearching = false
    var body: some View {
        HStack{
            Text(IsSearching ? "":"Fares Abuhader")
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
                }).offset(x: IsSearching ? -235:10, y: 0)
//                .padding(.trailing,-15)
                .foregroundColor(.black)
               
            }
            
            if !IsSearching {
                Button(action: {
                    
                }, label: {
                    ZStack {
                        Image(systemName: "pencil")
                        .resizable()
                        .frame(width: 20, height: 20)
                            .padding(8)
                            .background(Color(.quaternaryLabel))
                            .cornerRadius(50)
                    }

                })
                .padding()
                .foregroundColor(.black)
            }else{
                
            }

        }.offset(x: IsSearching ? 10:0, y: 0)
    }
}

struct profileHeader:View{
    @State var goToPrifleSettings = false
    var body: some View{
        VStack {
            ZStack{
                Image("Hangzhou")
                    .resizable()
                    .frame(width: 400, height: 200)
                    .cornerRadius(20)
                Rectangle()
                    .frame(width: 400, height: 30)
                    .foregroundColor(.white)
                    .offset(x: 0, y: 100)
                
                ZStack{
                    Image("fares")
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .center)
                        .clipShape(Circle())
                    Circle()
                        .stroke(Color.white, lineWidth: 4)
                        .frame(width: 204, height: 204)
                        .foregroundColor(.white)
                    
                    ZStack {
                        
                        Image(systemName: "camera.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(10)
                            .background(Color(.lightGray))
                            .cornerRadius(40)
                        Circle()
                            .stroke(Color.white, lineWidth: 5)
                            .frame(width: 40, height: 40, alignment: .center)
                    }
                    .offset(x: 70, y: 60)
                }.offset(x: 0, y: 60)
            }.padding(.bottom)
                
                
                ZStack {
                    VStack{
                        Text("Fares Abukhader")
                            .font(.title2)
                            .padding(.top,40)
                            .padding(.bottom,10)
                        Text("{والله يدعوا إلى دار السلام ويهدي من يشاء إلى صراط مستقيم}")
                            .padding(.bottom)
                        HStack{
                            Button(action: {}, label: {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 340, height: 35, alignment: .leading)
                                        .cornerRadius(8)
                                        .foregroundColor(Color("blueAddStory"))
                                    HStack{
                                        Image(systemName: "plus.circle.fill")
                                            .foregroundColor(.white)
                                        Text("Add Story")
                                            .foregroundColor(.white)
                                    }
                                }
                            })
                            ZStack {
                                Button(action: {goToPrifleSettings.toggle()}, label: {
                                    Image(systemName: "ellipsis")
                                        
                                        .foregroundColor(Color(.darkGray))
                                        .padding()
                                        .background(Color("FacebookGrayButton"))
                                        .cornerRadius(8)
                                }).frame(width: 50, height: 30, alignment: .center)
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {}).fullScreenCover(isPresented: $goToPrifleSettings, content: {
                                    ProfileSettings()
                                })
                            }
                            
                        }
                       
                    }
                }
        }
    }
}
struct HeaderPartTwo:View{
    @State var goToProfileAbout = false
    var body: some View{
//        ZStack {
            VStack(alignment: .leading) {
                
            HStack{
                Image(systemName: "house.fill")
                    .foregroundColor(Color(.lightGray))
                Text("Live in Hangzhou, china")
            }.padding(.bottom)
            HStack{
                Image(systemName: "mappin.circle.fill")
                    .foregroundColor(Color(.lightGray))
                Text("From Irbid")
            }.padding(.bottom)
            HStack{
                Image(systemName: "heart.fill")
                    .foregroundColor(Color(.lightGray))
                Text("Single")
            }.padding(.bottom)
            HStack{
                Image(systemName: "clock.fill")
                    .foregroundColor(Color(.lightGray))
                Text("Joined November 2011")
            }.padding(.bottom)
            HStack{
                Image(systemName: "rectangle.stack.badge.plus")
                    .foregroundColor(Color(.lightGray))
                Text("Followed by 372 people")
            }.padding(.bottom)
            HStack{
                ZStack {
                    Button(action: {goToProfileAbout.toggle()}, label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(Color(.lightGray))
                        Text("See Your About Info")
                            .foregroundColor(.black)
                    })
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {}).fullScreenCover(isPresented: $goToProfileAbout, content: {
                        profileAbout()
                    })
                }
            }.padding(.bottom)
        }
            .offset(x: -80, y: 0)
    }
}
struct FriendsImageView:View{
    @State var Image:String
    @State var Name:String
    var body: some View{
        ZStack {
            
            SwiftUI.Image(Image)
            .resizable()
            .frame(width: 120, height: 160, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .cornerRadius(10)
            .shadow(radius: 1)
            Rectangle()
                .frame(width: 120, height: 50)
                .cornerRadius(10)
                .offset(x: 0, y: 55)
                .foregroundColor(.white)
                .shadow(radius: 1)
            Rectangle()
                .frame(width: 120, height: 20)
                .offset(x: 0, y: 40)
                .foregroundColor(.white)
                
            Text(Name)
                .bold()
                .font(.caption)
                .offset(x: 0, y: 55)
                
           
        }
    }
    
}
struct Friends:View {
    var body: some View{
        
        VStack {
            Rectangle()
                .frame(width: 400, height: 0.4, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.black)

            HStack{
                Text("Friends")
                    .bold()
                    .font(.title3)
                    .padding(.leading)
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Find Friends")
                        .padding(.trailing)
                })
               
            }
                Text("598 friends")
                    .foregroundColor(Color(.lightGray))
                    .offset(x: -158)
                    .padding(.vertical,5)
            
            HStack{//"Fone","Ftwo","Fthree","Ffour","Ffife","Fsix"
                Spacer()
                FriendsImageView(Image: "Fone", Name: "Yahya abukalil")
                Spacer()
                FriendsImageView(Image: "Ftwo", Name: "Issa Mohammad")
                Spacer()
                FriendsImageView(Image: "Fthree", Name: "Isono suguru")
                Spacer()
            }.padding(.bottom)
            HStack{
                Spacer()
                FriendsImageView(Image: "Ffour", Name: "Abu fares")
                Spacer()
                FriendsImageView(Image: "Ffife", Name: "Obada abukader")
                Spacer()
                FriendsImageView(Image: "Fsix", Name: "Um Fares")
                Spacer()
            }.padding(.bottom)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("See All Friends")
                    .padding(.vertical,10)
                    .padding(.horizontal,140)
                    .background(Color("FacebookGrayButton"))
                    .cornerRadius(10)
                    .padding(.bottom)
            })
            Rectangle()
                .frame(width: 400, height: 0.3, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.black)
            HStack{
                Text("Posts")
                    .bold()
                    .padding(.leading)
                    .font(.title2)
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Filters")
                        .padding(.trailing)
                        .font(.title3)
                })
            }

        }
       

    }
}
struct updateProfileSuggest:View{
    @State var appear = true
    @State var goToprofileAbout = false
    var body: some View{
        if appear {
            VStack {
                Rectangle()
                    .frame(width: 390, height: 0.2)
                    .foregroundColor(Color(.lightGray))
                ZStack{
                    Rectangle()
                        .frame(width: 390, height: 160)
                        .foregroundColor(Color(.lightText))
                        .cornerRadius(5)
                        .shadow(radius: 0.3)
                    VStack{
                        HStack{
                            ZStack {
                                Image("fares")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                Button(action: {}, label: {
                                    ZStack {
                                        Circle()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(.white)
                                        Circle()
                                            .frame(width: 18, height: 18)
                                            .foregroundColor(.blue)
                                        
                                        Image(systemName: "pencil")
                                            .foregroundColor(.white)
                                    }
                                    .offset(x: 15, y: 15)
                                })
                                
                            }
                            VStack(alignment: .leading){
                                Text("What's new ,Fares ?")
                                    .font(.headline)
                                    .offset(x: 0, y: 10.0)
                                    .padding(.bottom,2)
                                Text("Let'us update some profile info that may")
                                    .font(.custom("", fixedSize: 14))
                                Text(" have changed.")
                                    .font(.custom("", fixedSize: 14))
                            }
                        }
                        .offset(x: -15, y: -10)
                        HStack{
                            Button(action: {appear.toggle()}, label: {
                                Text("Not Now")
                                    .padding(10)
                                    .padding(.horizontal,30)
                                    .background(Color("FacebookGray"))
                                    .cornerRadius(8)
                                    .foregroundColor(.black)
                            })
                            ZStack {
                                Button(action: {goToprofileAbout.toggle()}, label: {
                                    Text("Update Profile")
                                        .padding(10)
                                        .padding(.horizontal,30)
                                        .background(Color("blueAddStory"))
                                        .cornerRadius(8)
                                        .foregroundColor(.white)

                                })
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {}).fullScreenCover(isPresented: $goToprofileAbout, content: {
                                    EditProfile()
                                })
                            }
                        }
                        .offset(x: 0, y: 10)
                        
                    }
                }
            }
        }


    }
}
struct EditPublicDetails:View{
    var body: some View{
        HStack{
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
        }
    }
}
struct AddPostes: View {
    @EnvironmentObject var userData:UserData
    var body: some View {
        VStack{
            HStack{
                Image("fares")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    .padding(.leading,15)
                Text("What's on your mind?")
                    .padding(.horizontal,10)
                    .onTapGesture{
                        userData.addPostFromProfile = true
                    }
                Spacer()
            }
            Rectangle()
                .frame(width: 428, height: 0.1, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color(.lightGray))
            HStack{
                
                ZStack {
                    Image(systemName: "video.fill")
                        .foregroundColor(.red)
                        .padding(.leading,40)
                    
                    Image(systemName: "eye")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.white)
                        .offset(x:5)
                }
                Text("Live")
                    .padding(.horizontal,2)
                Rectangle()
                    .frame(width: 0.3, height: 20, alignment: .center)
                    .foregroundColor(Color(.lightGray))
                    .padding(.leading)
                Spacer()
                Image(systemName: "photo.on.rectangle.angled")
                    .foregroundColor(.green)
                Text("Photo")
                    .padding(.horizontal,2)
                Rectangle()
                    .frame(width: 0.3, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(.lightGray))
                    .padding(.leading)
                Spacer()
                
                HStack {
                    ZStack {
                        Image(systemName: "video.fill")
                            .foregroundColor(.purple)
                        
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.white)
                            .offset(x:-2)
                    }
                }
                Text("Room")
                    .padding(.trailing,40)
            }
            Rectangle()
                .frame(width: 428, height: 6, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color("FacebookGray"))
        }
    }
}
