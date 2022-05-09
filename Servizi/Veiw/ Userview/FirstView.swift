//
//  FirstView.swift
//  Servizi
//
//  Created by Tala Sadeq on 4/28/22.
//

import SwiftUI

struct FirstView: View {
    @StateObject var FirstVm = FirstViewModel()
    @EnvironmentObject var userVm : userLogIn
    @EnvironmentObject var LogOut : Connecter
    @State var isAuthenticated = true
    @State var now = Date()
    var body: some View {
        // Check here if defs is empty then show the 
        
        if(userVm.defs.object(forKey: "StoredToken") == nil ){
        
            FirstPageInApp()
        }
        else
        {
            if(now >= userVm.retreivedDate){
                testingVeiw()
                
            }
            else {
                TechnicainHomeView()
                
            }
        }
        
        
        
        
        
        
        
        
        
        
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
