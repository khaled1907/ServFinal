//
//  UserSharedViewModel.swift
//  Servizi
//
//  Created by Tala Sadeq on 4/5/22.
//

import Foundation
import SwiftUI
import Combine
class SharedViewModel : ObservableObject {
    @Published var isAuthenticated : Bool = false
  
    
    func logout(){
        let defaults = UserDefaults.standard
                defaults.removeObject(forKey:"StoredToken")
                DispatchQueue.main.async {
                    self.isAuthenticated = false
                }
        
        
    }
   
    
    
}
