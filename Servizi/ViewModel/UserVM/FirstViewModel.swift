//
//  FirstViewModel.swift
//  Servizi
//
//  Created by Tala Sadeq on 4/28/22.
//

import Foundation
import SwiftUI

class FirstViewModel : ObservableObject {
    
    @Published var StoredToken = UserDefaults.standard
    @Published var retreiveValue = ""
    @Published var isEmpty : Bool = true
    @Published var takeit = ""
    /////////////////////
    @StateObject var LogInVm = userLogIn()
    
    func checkToken(){
        
        
        if(LogInVm.defs.object(forKey: "StoredToken") == nil)
        {
            isEmpty = true
        self.takeit = StoredToken.object(forKey: "StoredToken") as! String
            print("This is the stored token : \(takeit)")
            
        }
        else {
            isEmpty = false
        }
        
    }
    
    
    
    
    
        
        
        
        
    
    
    
    
    
    
    
    
}
