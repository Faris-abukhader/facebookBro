//
//  UserData.swift
//  facebookBro
//
//  Created by admin on 2021/2/4.
//

import Foundation
import SwiftUI
final class UserData:ObservableObject{
    @Published var showFullScreen = false
    @Published var showStory = false
    @Published var storyPhoto = " "
    @Published var logo = " "
    @Published var name = " "
    @Published var addPostFromProfile = false
    @Published var showList1 = false
    @Published var showList2 = false
    @Published var showList3 = false
    @Published var fullScreenStory = false
    @Published var photo = " "
    @Published var profile = " "
    @Published var names = " "
    @Published var hideTabbar = false
   


}

