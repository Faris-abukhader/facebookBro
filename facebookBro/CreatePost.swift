//
//  CreatePost.swift
//  facebook
//
//  Created by admin on 2021/1/1.
//

import SwiftUI

struct CreatePost: View {
    @State var GoBack = false
    @State var dragPositon = CGSize.zero
    @State var ComeBack = false
    @State var ListPopUp = false
    @State var B = false
    @State  var text:String = " "
    @State var GoToPrivacy = false
    @State var ToPhotoLibrary = false
    @State var IsEmpty = true
    var body: some View {
            ZStack {
                VStack {
                    HStack{ // Create Post Header
                        Button(action: {
                                ComeBack.toggle()
                            
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
                            ComeBack.toggle()
                            if !text.isEmpty {
                            ComeBack.toggle()
                          }

                        }, label: {
                            Text("Post")
                                .foregroundColor(.black)
                        })
                        .padding(.trailing)
                        .fullScreenCover(isPresented: $ComeBack, content: {
                            Timeline(editPostList: $B)
                        })

                    }
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
                           
                    }

                    
                    // end post proifle view

//                    PostProfile(text: self.text)
                    Spacer()
                }
                
                DrapList()
                    .offset( y: ListPopUp ? 250:730)  //250:730      // 700  // 300
//                    .offset( y: dragPositon.height)
                    .animation(.spring())
                    .gesture(
                        DragGesture()
                            .onChanged{ value in
                                self.dragPositon = value.translation
                                if dragPositon.height < 250 {
                                    ListPopUp.toggle()
                                }else if dragPositon.height > 150 {
                                    ListPopUp.toggle()
                                }
                            }
                            .onEnded{ value in
                            }

                    )

                    
            
            
        }

    }
}

struct CreatePost_Previews: PreviewProvider {
    static var previews: some View {
        CreatePost()
    }
}
struct CreatePostHeader: View {
    var body: some View {
        HStack{
            Image(systemName: "xmark")
                .frame(width: 25, height: 25)
                .padding(.leading)
            Spacer()
            Text("Create Post")
            Spacer()

            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Post")
                    .foregroundColor(.black)
            })
            .padding(.trailing)

        }
    }
}
struct PostProfile:View{
    @State  var text:String
    @State var GoToPrivacy = false
    @State var ToPhotoLibrary = false
    @State var IsEmpty = true
    var body: some View{
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
                TextField("What's on your mind?", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .frame(width: 400, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.top)

        }
    }
}
struct DrapList:View{
    @State var icons:[String]=["video.fill","photo.on.rectangle.angled","tag.fill","face.smiling","mappin.circle.fill","camera.fill","textformat.abc.dottedunderline","gif","video.bubble.left.fill","questionmark.square.fill","video.circle.fill","dollarsign.square.fill"]
    @State var labels:[String] = ["Create Room","Photo/Video","Tag Friends","Feelin/Activity","Check In","Camera","Backround Color","GIF","Live Video","Ask For Recommendations","Watch Party","Sell Something"]
    @State var color:[Color] = [Color.purple,Color.green,Color.blue,Color.yellow,Color.red,Color.blue,Color(.cyan),Color(.cyan),Color.red,Color.red,Color.purple,Color.green]
    @State var ToPhotoLibrary = false
    @State var PostImage = UIImage.self
    var body: some View{
        ZStack{
            Rectangle()
                .frame(height: 700, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .cornerRadius(3)
                .shadow(radius: 6)
                Rectangle()
                    .frame(width: 50, height: 10)
                    .cornerRadius(4)
                    .foregroundColor(Color(.darkGray))
                    .opacity(0.7)
                    .offset(x: 0, y: -330)
                            
            VStack(alignment: .leading){
                ForEach(0..<12){ i in
                    if i == 7 {
                        DrapListElementsPlus(icon: $icons[i], label: $labels[i])
                            .padding(.bottom)
                            .offset(x: -70, y: -55)
                    }else{
                        ZStack {
                            DrapListElements(icon: $icons[i], label: $labels[i],color: $color[i])
                                .padding(.bottom)
                                .offset(x: -70, y: -55)
                                .onTapGesture {
                                    if i==1{
                                        ToPhotoLibrary.toggle()
                                    }

                            }
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {}).fullScreenCover(isPresented: $ToPhotoLibrary, content: {
                                PhotoPicker()
                            })
                        }

                            
                    }
                }
                
            }
                
        }
    }
}
struct DrapListElements:View{
    @Binding var icon:String
    @Binding var label:String
    @Binding var color:Color
    var body: some View{
        HStack{
            Image(systemName: icon)
                .foregroundColor(color)
                
            Text(label)
                .offset(x: 10, y: 0)
                
        }
    }
}
struct DrapListElementsPlus:View{
    @Binding var icon:String
    @Binding var label:String
    var body: some View{
        HStack{
            Image(icon)
                .resizable()
                .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(label)
        }
    }
}
struct PhotoPicker:UIViewControllerRepresentable{
//    @Binding var SelectedPhoto:UIImage
    func makeUIViewController(context: Context) -> some UIImagePickerController {
        let controller = UIImagePickerController()
//        controller.delegate = context.coordinator
        return controller
    }
    
//    func makeCoordinator() -> PhotoPicker.Coordinator {
//        return Cordinator()
//    }
    class Cordinator : NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
        
        let parent:PhotoPicker
        init(parent :PhotoPicker) {
            self.parent = parent
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
             let ImageSelected = info[.originalImage] as? String
//            CreatePost().PostImage = ImageSelected.
            
            
        }
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
