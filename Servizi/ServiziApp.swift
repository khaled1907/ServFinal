//
//  ServiziApp.swift
//  Servizi
//
//  Created by khaled on 2/28/22.


import SwiftUI

@main
struct ServiziApp: App {
    @StateObject var connect = Connecter()
    @StateObject var userVm = userLogIn()
    @StateObject var shared = SharedViewModel()
    var body: some Scene {
        
        WindowGroup{
     
            //login()
       // FirstPageInApp().environmentObject(connect)
            Loadiing().environmentObject(connect)
            //Loading()
           // ClickTheButton()
      //  SettingUser().environmentObject(connect)
     // TechnicainHomeView().environmentObject(connect).environmentObject(userVm).environmentObject(shared)
            //FirstView().environmentObject(connect).environmentObject(userVm)
          // viewToMakeAppoint().environmentObject(connect).environmentObject(userVm).environmentObject(shared)
            
        }
    }
}
