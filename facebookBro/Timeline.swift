//
//  Timeline.swift
//  facebook
//
//  Created by admin on 2020/12/27.
//

import SwiftUI

struct Timeline: View {
    @State var images=["food1","food2","food3","food4","food5","food6","food7","food8","food9","food10"]
    @State var postText = ["Hello Friends","Lovely Pic","Food Lover hh","Live Before I eat it","no food no life","here we go","oh god i can't","After long day of fasting finaly...","come on baby","busmullah"]
    @State var labels = [ "yahya abukahlil","Issa Mohmmad","Isono Sugguru","Abu Fares","Obada Abukhadir","Um fares","yahya abukahlil","Issa Mohmmad","Isono Sugguru","Abu Fares"]
    @State var OnlLineImage = ["Fone","Ftwo","Fthree","Ffour","Ffife","Fsix","Fone","Ftwo","Fthree","Ffour"]
    var StoryImage = ["p1","p2","p3","p4","p5","p6"]
    @State var iconsEidt = ["square.and.arrow.down.fill","pencil","globe","archivebox","rectangle.stack.badge.plus","minus.circle","bell"]
    @State var labelEdit = ["Save Post","Edit Post","Edit Privacy","move to archive","add to album","delete","turn off notification?"]

    @State var postNum = 10
    @State var GoToCreatePost = false
    @State var CreateRoomButton = false
    @State var GoToSeeMoreStories = false
    @State var DownviewState:CGSize = .zero
    @Binding var editPostList:Bool
    var suggestFriend = Int.random(in: 4..<10)
    var suggestGroup = Int.random(in: 3..<10)
    @State var Hide = false
    @State var HideGroupSuggestion = false
    @State var GoToSeeAll = false
    @State var goToMoreGroup = false
    @State var addPostText = ""
    @State var popUpCreatePost = false
    //
    @State var GoBack = false
    @State var dragPositon = CGSize.zero
    @State var ComeBack = false
    @State var ListPopUp = false
    @State var B = false
    @State  var text:String = ""
    @State var GoToPrivacy = false
    @State var ToPhotoLibrary = false
    @State var IsEmpty = true
    @EnvironmentObject var userdata:UserData
    @State var Gicons = ["gl1","gl2","gl3","gl4","gl5","gl6","gl7","gl8","gl9"]
    @State var Glabel = ["Googler","MR BEAST","ASTRONOMY LOVER","expat in china","Swiftui","Python","Animals Lover","Students in china","ABU SRWAL"]

    var body: some View {
        ZStack {
            
            ScrollView(.vertical,showsIndicators: false) {
                ZStack {
                    
                    VStack{
                        
                        MyToolBar()
                        AddPoste()
                        Button(action: {
                            GoToCreatePost.toggle()
                        }, label: { }).fullScreenCover(isPresented: $GoToCreatePost, content: {
                            CreatePost()
                        })
                        ScrollView(.horizontal,showsIndicators: false){
                            
                            if !CreateRoomButton {
                                HStack{
                                    CreateRoom()
                                        .frame(width: 60, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .padding()
                                        .padding(.horizontal)
                                        .onTapGesture {
                                            self.CreateRoomButton.toggle()
                                        }
                                    ForEach(0..<6){s in
                                        peopleRoom(image: OnlLineImage[s])
                                    }
                                    ForEach(0..<6){s in
                                        peopleRoom(image: OnlLineImage[s])
                                    }
                                }
                            }else{
                                HStack{
                                    CreateRoomAfterClick()
                                        .frame(width: 60, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .padding()
                                        .padding(.horizontal)
                                        .padding(.leading)
                                    ForEach(0..<6){s in
                                        peopleRoomAfterClick(name: labels[s], images: OnlLineImage[s])
                                    }
                                    ForEach(0..<6){s in
                                        peopleRoomAfterClick(name: labels[s], images: OnlLineImage[s])
                                    }

                                }
                                .padding(.vertical)
                                
                            }
                            
                        }
                        Rectangle()
                            .frame(width: 428, height: 6, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color("FacebookGray"))
                        
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack{
                                ZStack {
                                    AddNewStroy().onTapGesture {
//                                        GoToTestPage.toggle()
//                                        self.userdata.showFullScreen.toggle()
//                                        displayBarTab.hidden = true
//                                        userdata.showFullScreen = true
                                    }
                                }
                                ForEach(0..<6){ s in
                                    PeopleStory(profile: OnlLineImage[s], storyImage: StoryImage[s],Names: labels[s])
                                        .padding(.horizontal,5)

                                            
                                }
                                
                            }
                            .padding(.top)
                        }.padding(.horizontal,15)
                        HStack {
                            Button(action: {
                                GoToSeeMoreStories.toggle()
                            }, label: {
                                VStack {
                                    Text("Show More")
                                        .bold()
                                        .foregroundColor(.blue)
                                        .frame(width: 400, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .background(Color("FacebookBlueBackgroundButton"))
                                        .cornerRadius(10)
                                    
                                }
                            })
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {}).fullScreenCover(isPresented: $GoToSeeMoreStories, content: {
                                ShowMoreStory()
                            })
                        }
                        
                        Rectangle()
                            .frame(width: 428, height: 6, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color("FacebookGray"))
                        
                        
                        ScrollView(.vertical,showsIndicators: false){
                            VStack{
                                ForEach((0..<postText.count).reversed(),id:\.self){ s in
                                    if s==suggestFriend{
                                        HStack {
                                            if Hide{
                                                
                                            }else{
                                                Text(Hide ? " ":"People You May Know")
                                                    .bold()
                                                    .padding(.leading)
                                                Spacer()
                                                
                                            }
                                            Button(action: {
                                                Hide.toggle()
                                            }, label: {
                                                if Hide{Spacer()}
                                                Text(Hide ? "Show":"Hide")
                                                    .padding(.trailing)
                                                    .padding(.bottom,Hide ? -5:0)
                                                
                                            })
                                            
                                        }
                                        
                                        if !Hide {
                                            Rectangle()
                                                .frame(width: .infinity, height: 0.4, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .foregroundColor(Color(.lightGray))
                                            
                                            ScrollView(.horizontal, showsIndicators: false){
                                                
                                                HStack{
                                                    ForEach(0..<6){s in
                                                        PeopleMayYouKnow(image: OnlLineImage[s], name: labels[s])
                                                            .padding(.vertical)
                                                    }
                                                    seeAll()
                                                        .padding(.horizontal)
                                                        .onTapGesture {
                                                            GoToSeeAll.toggle()
                                                        }
                                                    
                                                    Button(action: {
                                                        GoToSeeAll.toggle()
                                                    }, label: { }).fullScreenCover(isPresented: $GoToSeeAll, content: {
                                                        SeeAllView()
                                                    })
                                                    
                                                }
                                                .padding(.leading)
                                                
                                            }
                                            Rectangle()
                                                .frame(width: .infinity, height: 0.4, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .foregroundColor(Color(.lightGray))
                                            
                                        }

                                    }
                                    if suggestGroup==s && suggestGroup != suggestFriend {
                                        HStack {
                                            if HideGroupSuggestion{
                                                
                                            }else{
                                                Text(HideGroupSuggestion ? " ":"Suggested Group")
                                                    .bold()
                                                    .padding(.leading)
                                                Spacer()
                                                
                                            }
                                            Button(action: {
                                                HideGroupSuggestion.toggle()
                                            }, label: {
                                                if HideGroupSuggestion{Spacer()}
                                                Text(HideGroupSuggestion ? "Show":"Hide")
                                                    .padding(.trailing)
                                                    .padding(.bottom,HideGroupSuggestion ? -5:0)
                                                
                                            })
                                            
                                        }

                                        if !HideGroupSuggestion {
                                            Rectangle()
                                                .frame(width: .infinity, height: 0.4, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .foregroundColor(Color(.lightGray))
                                            
                                            ScrollView(.horizontal, showsIndicators: false){
                                                
                                                HStack{
                                                    ForEach(0..<Glabel.count){ s in
                                                            groupSugggestion(label: Glabel[s], image: Gicons[s])
                                                                .padding(.top)
                                                                .padding(.bottom,160)
                                                        
                                                    }
                                                }
                                                .padding(.leading)
                                                
                                            }
                                            ZStack {
                                                Button(action: {goToMoreGroup.toggle()}, label: {
                                                        HStack{
                                                            Text("Discover More Groups")
                                                                .foregroundColor(.black)
                                                            Image(systemName: "chevron.right")
                                                                .foregroundColor(.black)
                                                        }
                                                })
                                                Button(action: {}, label: {}).fullScreenCover(isPresented: $goToMoreGroup, content: {
                                                    moreGroup()
                                                })
                                            }
                                            Rectangle()
                                                .frame(width: .infinity, height: 0.4, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .foregroundColor(Color(.lightGray))


                                        }

                                    }
                                    
                                    Postes(imagess: images[s], PostText: postText[s],profile: OnlLineImage[s],name:labels[s])
                                    
                                    Rectangle()
                                        .frame(width: 428, height: 4, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(Color("FacebookGray"))
                                        .padding(.top,10)
                                    
                                    
                                }
                            }
                        }
                        Spacer()
                        
                    }
                    
                }
                
                
            }.onTapGesture {
                CreateRoomButton = false
            }
            
            
            
            
            
            
            
            ZStack{
//                if popUpCreatePost {
                if userdata.showFullScreen {
                    Color.white.ignoresSafeArea(.all)
                    // start test     ============================================================
                    
                    
                    ZStack {
                        VStack {
                            HStack{ // Create Post Header
                                Button(action: {
//                                        ComeBack.toggle()
                                    popUpCreatePost.toggle()
                                    self.userdata.showFullScreen = false
                                }, label: {
                                    Image(systemName: "xmark")
                                        .frame(width: 25, height: 25)
                                        .padding(.leading)
                                        .foregroundColor(.black)
                                })
                                .fullScreenCover(isPresented: $ComeBack, content: {
                                    ContentView()
                                })
                               
                                Spacer()
                                Text("Create Post")
                                Spacer()
                                Button(action: {
//                                    ComeBack.toggle()
                                    if !text.isEmpty {
//                                    ComeBack.toggle()
                                        postText.append(text)
                                        images.append("")
                                        OnlLineImage.append("fares")
                                        labels.append("Fares Abukahder")
                                    postNum=postText.count
//                                    print(postNum)
//                                    print(text)
                                    userdata.showFullScreen = false
                                
                                        popUpCreatePost.toggle()
                                        text = ""

                                  }

                                }, label: {
                                    Text("Post")
                                        .foregroundColor(.black)
                                })
                                .padding(.trailing)
//                                .fullScreenCover(isPresented: $ComeBack, content: {
//                                    Timeline(editPostList: $B)
//                                })

                            }
//                            .onAppear{
//                                displayBarTab.disable = false
//                            }
                            
                            
                            
                            
                            // start post proifle view
                            
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
//                                    .onTapGesture {
////                                        self.userdata.showFullScreen.toggle()
//                                        displayBarTab.hidden = true
//                                        userdata.showFullScreen = true
//
//                                    }
                                   
                            }

                            
                            // end post proifle view    =============================

        //                    PostProfile(text: self.text)
                            Spacer()
                        }
                        
//                        DrapList()
//                            .offset( y: ListPopUp ? 250:700)
//        //                    .offset( y: dragPositon.height)
//                            .animation(.spring())
//                            .gesture(
//                                DragGesture()
//                                    .onChanged{ value in
//                                        self.dragPositon = value.translation
//                                        if dragPositon.height < 250 {
//                                            ListPopUp.toggle()
//                                        }else if dragPositon.height > 150 {
//                                            ListPopUp.toggle()
//                                        }
//                                    }
//                                    .onEnded{ value in
//                                    }
//
//                            )

                            
                    
                    
                }

                    
                    
                    // end test
                    
                    
                }
            }
           
            
            //////// ========================================
        }
//        .onAppear{
//            if addPostText != ""{
//                postText.append(addPostText)
//                postNum+=1
//            }
//        }
        
    }
}

struct Timeline_Previews: PreviewProvider {
    static var previews: some View {
        Timeline(editPostList: Binding.constant(false))
    }
}

struct AddPoste: View {
//    @State var GoToCreatePost=false
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
//                        GoToCreatePost.toggle()
//                        displayBarTab.hidden = true
                        userData.showFullScreen = true

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


struct AddNewStroy: View {
    var body: some View {
        
        HStack {
            ZStack {
                Image("fares")
                    .resizable()
                    .frame(width: 110, height: 200)
                    .cornerRadius(15)
                    .shadow(color: .black, radius: 1)
                Rectangle()
                    .frame(width: 114, height: 60)
                    .cornerRadius(15)
                    .offset(x: 0, y: 70)
                    .foregroundColor(Color("FacebookGrayButton"))
                
                Rectangle()
                    .frame(width: 114, height: 20)
                    .offset(x: 0, y: 50)
                    .foregroundColor(Color("FacebookGrayButton"))
                
                
                
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 45, height: 45, alignment: .center)
                    .foregroundColor(.white)
                    .background(Color(.blue))
                    .cornerRadius(25)
                    .offset(x: 0, y: 45)
                VStack{
                    Text("Create a")
                        .font(.caption)
                        .foregroundColor(.black)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
                    Text("Story")
                        .font(.caption)
                        .foregroundColor(.black)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
                    
                }.offset(x: 0, y: 80)
                
            }
            .navigationBarHidden(true)
        }
    }
}


struct PeopleStory: View {
    @State var profile:String
    @State var storyImage:String
    @State var Names:String
    @State var goToStoryViewer = false
    @State var tapped = false
    @EnvironmentObject var userdata:UserData
    var body: some View {
        
        
        HStack {
            ZStack {
                Image(storyImage)
                    .resizable()
                    .frame(width: 110, height: 200)
                    .cornerRadius(15)
                    .shadow(color: .black, radius: 1)
                    .onTapGesture {
                        tapped = true
                        userdata.showStory = true
                        userdata.storyPhoto = storyImage
                        userdata.name = Names
                        userdata.logo = profile
                        print (Names)
                    }
                Image(profile)
                    .resizable()
                    .frame(width: 35, height: 35, alignment: .center)
                    .overlay(Circle().stroke(Color(tapped ? .white:.blue),lineWidth: tapped ? 2:4))
                    .cornerRadius(25)
                    .offset(x: -30, y: -65)
                
                VStack{
                    Text(Names)
                        .font(.caption)
                        .foregroundColor(.white)
                        .offset(x: -30, y: -10)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
                    
                }.offset(x: 20, y: 90)
                        
            }
        }
    }
}


struct Postes: View {
    @State var imagess:String
    @State var PostText:String
    @State var EditPostPage = false
    @State var shareList = false
    @State var Like = false
    @State var showComent = false
    @State var commentContent:[String]=[]
    @State var addComment = false
    @State var text = " "
    @State var showAllComments = false
    @State var EditListOffset:CGSize = .zero
    @State var ShareListOffset:CGSize = .zero
    @State var profile:String
    @State var name:String
    var time = Int.random(in: 2..<50)
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
                                Button(action: {EditPostPage.toggle()}, label: {
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
                    if imagess != " " {
                        Image(imagess)
                            .resizable()
                            .frame(width: 428, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                }
                    .padding(.top)
                    .padding(.bottom,Like ? 3:3)
            
                
                
                HStack{
                    if Like {
                        Text("1 Like")
                            .padding(.leading)
                    }
                    Spacer()
                    if commentContent.count != 0 {
                    Button(action: {showAllComments.toggle()}, label: {
                        Text("\(commentContent.count) Comments")
                            .padding(.trailing)
                            .foregroundColor(.black)
                    })
                    }
                    
                }
                
                Rectangle()
                    .frame(width: 400, height: 0.3, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(.lightGray))
                    .offset(x: 14)
                
                HStack{
                    Button(action: {Like.toggle()}, label: {
                        Image(systemName:Like ? "hand.thumbsup.fill":"hand.thumbsup").padding(.leading,30)
                            .foregroundColor(Like ? .red:.black)
                        Text("Like")
                            .foregroundColor(.black)
                        
                    })
                    
                    Spacer()
                    Button(action: {showComent.toggle()}, label: {
                        Image(systemName: "bubble.left").foregroundColor(.black)
                        Text("Comment").foregroundColor(.black)
                    })
                    Spacer()
                    Button(action: {shareList.toggle()}, label: {
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
                
                if showAllComments && commentContent.count != 0{
                    ForEach(0..<commentContent.count)  { s in
                        Commments(text:commentContent[s]).padding(.leading,10)
                    }
                }
                if !showAllComments && commentContent.count != 0 {
                    Commments(text:commentContent[0]).padding(.leading,10)
                    
                }
                
                if showComent {
                    ZStack {
                        
                        Rectangle().frame(width: 400, height: 50).foregroundColor(Color("FacebookGrayButton")).cornerRadius(25).padding(.leading,13)
                        TextField("Write A comment...", text: $text)
                            .frame(width: 230, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .multilineTextAlignment(.leading)
                            .padding(7)
                            .background(Color("FacebookGrayButton"))
                            .cornerRadius(25)
                            .padding(.leading,-100)
                        HStack {
                            Button(action: {
                                    addComment.toggle()
                                if !text.isEmpty {
                                    commentContent.append(text)
                                    text = " "
                                }
                            }, label: {
                                Image(systemName: "plus.circle").resizable().frame(width: 30, height: 30).padding(.trailing,5).foregroundColor(Color(.lightGray))
                            })
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image(systemName: "g.square").resizable().frame(width: 30, height: 30).padding(.trailing,5).foregroundColor(Color(.lightGray))
                            })
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image(systemName: "face.smiling").resizable().frame(width: 30, height: 30).padding(.trailing,5).foregroundColor(Color(.lightGray))
                            })
                        }.offset(x:140)
                    }
                }
                
                
                
            }
            
            
            
           //=======================//itemforlisteditpost========================================
            ItemForEditPostList()
                .offset(x: EditPostPage ? 0:-500, y: -40)
                .offset(x: EditListOffset.width, y: -40)
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            self.EditListOffset = value.translation
                        }
                        .onEnded{
                            value in
                            if EditListOffset.width < 0 {
                                EditListOffset.width = -EditListOffset.width
                            }
                            if EditListOffset.width > 150 {
                                EditPostPage.toggle()
                            }
                            self.EditListOffset=CGSize.zero
                        }

                ).animation(.spring())
            
            
            //=======================//itemforlisteditpost========================================
            
            if shareList {
                shareListDrag()
                    .offset(x: shareList ? 0:-500, y: -40)
                    .offset(x: ShareListOffset.width, y: -40)
                    .gesture(
                        DragGesture()
                            .onChanged{ value in
                                self.ShareListOffset = value.translation
                            }
                            .onEnded{
                                value in
                                if ShareListOffset.width < 0 {
                                    ShareListOffset.width = -EditListOffset.width
                                }
                                if ShareListOffset.width > 150 {
                                    shareList.toggle()
                                }
                                self.ShareListOffset = CGSize.zero
                            }

                    ).animation(.spring(response: 0.010, dampingFraction: 0.010, blendDuration: 0.020))

            }
            
        }
        .onTapGesture {
            withAnimation{
                shareList = false
                EditPostPage = false
            }
        }
    }
}

struct CreateRoom:View{
    var body: some View{
        ZStack {
            Capsule()
                .strokeBorder()
                .frame(width: 100, height: 40, alignment: .center)
            
            
            HStack{
                Image(systemName: "video.badge.checkmark")
                VStack{
                    Text("Create")
                        .font(.caption)
                    Text("Room")
                        .font(.caption)
                    
                }
            }
        }
        
    }
}

struct peopleRoom :View{
    @State var image:String
    var body: some View{
        ZStack {
            Image(image)
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .shadow(radius: 2)
            ZStack{
                Circle()
                    .frame(width: 15, height:15, alignment: .center)
                    .foregroundColor(.white)
                Circle()
                    .foregroundColor(.green)
                    .frame(width: 10, height: 10, alignment: .center)
            }.offset(x: 15.0, y: 15.0)
            
            
        }
    }
}
struct CreateRoomAfterClick: View{
    var body:some View{
        ZStack{
            Rectangle()
                .frame(width: 130, height: 180)
                .foregroundColor(Color(.white))
                .cornerRadius(10)
                .shadow(radius: 2)
            VStack{
                ZStack {
                    
                    Image(systemName: "video.badge.checkmark")
                        .padding()
                        .offset(x: 0, y: 10.0)
                    Circle()
                        .stroke(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, lineWidth: 2)
                        .padding()
                        .cornerRadius(30)
                        .frame(width: 80, height: 80)
                        .offset(x: 0, y: 10.0)
                    
                    
                    
                }
                
                Text("Fares's Room")
                    .font(.subheadline)
                    .bold()
                    .padding(.bottom)
                Text("Get Started")
                    .font(.caption2)
                    .foregroundColor(Color(.lightGray))
                
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    ZStack {
                        Text("Create")
                            .font(.caption2)
                        Rectangle()
                            .stroke(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                            .frame(width: 110, height: 20)
                            .cornerRadius(2)
                        
                        
                        
                    }
                    
                })
                .padding(.bottom)
                
            }
        }
    }
}
struct peopleRoomAfterClick:View{
    @State var name:String
    @State var images:String
    var body: some View{
        ZStack{
            Rectangle()
                .frame(width: 130, height: 180)
                .foregroundColor(Color(.white))
                .cornerRadius(10)
                .shadow(radius: 2)
            VStack{
                
                Image(images)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .padding()
                
                Text(name)
                    .font(.subheadline)
                    .bold()
                    .padding(.bottom)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    ZStack {
                        Text("Say Hi")
                            .font(.caption2)
                        Rectangle()
                            .stroke(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                            .frame(width: 110, height: 20)
                            .cornerRadius(2)
                        
                        
                        
                    }
                    
                })
                .padding(.top,5)
                
            }
        }
    }
}
struct ItemForEditPostList:View{
    var icons = ["square.and.arrow.down.fill","pencil","globe","archivebox","rectangle.stack.badge.plus","minus.circle","bell"]
    var label = ["Save Post","Edit Post","Edit Privacy","move to archive","add to album","delete","turn off notification?"]
    var body: some View{
        
        ZStack {
            Rectangle()
                .frame(width:430,height:430)
                .foregroundColor(Color(.white))
                .cornerRadius(25)
                .shadow(radius:1)
                VStack(alignment: .leading)  {
                    ForEach(0..<7){ s in
                        Button(action: {
                            if s == 5 {
                                
                            }
                            
                        }, label: {
                            VStack {
                                HStack(alignment:.center){
                                    Image(systemName: icons[s])
                                        .resizable()
                                        .frame(width:30,height:30)
                                        .padding(.bottom).foregroundColor(Color(.black))
                                    VStack(alignment: .leading) {
                                        Text(label[s]).foregroundColor(Color(.black))
                                            .padding(.bottom)
                                    }
                                }
                            }

                        })
                    }
                    
                }
                .frame(width: 300, height: 350)
                .padding()
                .offset(x: -80,y:0)
            
        }.animation(.spring())

        
    }
}
struct shareListDrag:View{
    @State var label = ["Share To Your Story","Share To a Page's Story","Send in Messenger","Share To a Page","Share To a Group","More Options"]
    @State var icons = ["plus.circle","plus.circle","plus.message.fill","flag","person.2","square.and.arrow.up"]
    var body: some View{
        VStack {
            ZStack {
                
                Rectangle()
                    .frame(maxWidth: 430,maxHeight: 430)
                    .cornerRadius(20)
                    .foregroundColor(Color(.white))
                    .shadow(radius: 2)
                
                
                VStack(alignment: .leading)  {
                    PostProfile(text: "")
                    HStack {
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Share Now")
                                .font(.caption)
                                .bold()
                                .padding(10)
                                .padding(.horizontal)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(5)
                                .padding(.trailing)
                        })
                    }
                    ForEach(0..<6){s in
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            HStack {
                                Image(systemName: icons[s]).foregroundColor(.black)
                                Text(label[s]).foregroundColor(.black)
                            }.padding(.bottom)
                        })
                    }
                }
                .padding(.leading)
                .animation(.spring())
            }
        }
        
    }
}
struct groupSugggestion:View{
    @State var label:String
    @State var image:String
    var num = Int.random(in: 10..<60)
    var num1 = Int.random(in: 1..<9)
    var body: some View{
        ZStack {
           Image(image)
            .resizable()
            .frame(width: 300, height: 150)
            .cornerRadius(10)
            .shadow(radius: 1)
            Rectangle()
                .frame(width: 300, height: 150)
                .cornerRadius(10)
                .offset(y: 140)
                .foregroundColor(.white)
                .shadow(radius: 1)
                Rectangle()
                    .frame(width: 300, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .offset(y: 70)
                    .foregroundColor(.white)
            VStack(alignment: .leading) {
                Text(label)
                    .bold()
                    .font(.subheadline)
                Text("\(num)K members . \(num1)K posts a week")
                    .foregroundColor(Color(.lightGray))
                    .font(.caption)

                HStack{
                    Image("fares")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    Text("Popular with people interested in Uae Skills")
                        .font(.caption2)
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Join")
                        .bold()
                        .padding(.vertical,5)
                        .padding(.horizontal,100)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .offset(x: 20, y: 0)

                })
            }.offset( x:-5,y: 140)
        }

    }
}

