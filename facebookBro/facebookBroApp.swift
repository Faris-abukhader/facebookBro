//
//  facebookBroApp.swift
//  facebookBro
//
//  Created by admin on 2021/2/3.
//

import SwiftUI

@main
struct facebookBroApp: App {
    @StateObject  var order = UserData()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(order)
        }
    }
}
