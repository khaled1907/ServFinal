//
//  TechProfileViewModel.swift
//  Servizi
//
//  Created by Tala Sadeq on 4/29/22.
//

import Foundation
import SwiftUI
class TechProfileViewModel : ObservableObject {
    
    struct response  : Codable{
        var msg : String
        var technician : Technicians
        var reviews : [Reviews]
        
    }
    struct Technicians : Codable{
        
        var firstName : String
        var lastName : String
        var email : String
        var phone : String
        var governorate : String
        var city : String
        var profession: String
        
        
    }
    struct Reviews : Codable {
        
        var id : Int
        var content : String
        var rate : Int
        var technicianId : Int
        var userId : Int
        var appointmentId : Int
        var createdAt : String
        var user : User
        
    }
    struct User : Codable {
        var firstName : String
        var lastName : String
    }
    
    enum States {
        case Loading
        case Loaded
        case Error
    }
    @Published var state : States = .Loading
    @Published var JsonData = response(msg: "", technician: Technicians(firstName: "", lastName: "", email: "", phone: "", governorate: "", city: "", profession: ""),reviews: [])
    //@Published var JsonData = response(msg: "", technician: [],reviews: [])
    
    func getProfile(token : String){
      
        guard let url = URL(string: "https://servizi.seifahmed.com/technician/profile") else {
        print("Invalid Url")
        return
            
        }
        var request = URLRequest(url: url)
        request.addValue(token, forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { data, resp, _ in
            guard let resp = resp as? HTTPURLResponse else { return }
                print(resp.statusCode)
        do {
                
             let talaaa = try JSONDecoder().decode(response.self, from: data!)
                DispatchQueue.main.async {
                    self.JsonData = talaaa
                print(self.JsonData)
                    if(resp.statusCode == 200){
                        self.state = .Loaded
                    }else {
                        self.state = .Error
                    }
                    
                    
                }
            
       } catch {
        print(error.localizedDescription)
        self.state = .Error
                }
        
             }.resume()
    
        }
    
        
        
    }
   
    
    

