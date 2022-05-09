//
//  ConnectsBookWApp.swift
//  Servizi
//
//  Created by Tala Sadeq on 4/22/22.
//

import Foundation
import SwiftUI


class Connecter : ObservableObject {
    @StateObject var Update = UpdatingAddress()
    @Published var obj = userLogIn()
    @Published var firstName : String = ""
    @Published var lastName : String = ""
    @Published var technicianId : Int = 0
    @Published var city : String = ""
    
    @Published var chosenprof : String = ""
    @Published var writtenProf : String = ""
    
    @Published var token : String = ""
    
    //
    @Published var logOutNow : Bool = false
    
    @Published var logOutAlert :Bool = false
    
    //If found better way delete thefollowing
    
    @Published var loadNow : Bool = false
    @Published var Successful : Bool = false
    @Published var Failed : Bool = false
   
    
       
}
