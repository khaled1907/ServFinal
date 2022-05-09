//
//  ViewTechProfile.swift
//  Servizi
//
//  Created by Tala Sadeq on 4/18/22.
//

import Foundation
import SwiftUI

class ViewTechProfile : ObservableObject {
    
    
struct response : Codable {
        var firstName : String
        var lastName : String
        var email :String
        var phone :String
        var governorate :String
        var city : String
        var profession : String
        var reviews : [Reviews]
        var rateAvg : String
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
    
    
    
  

    
    @Published var JsonData = response(firstName: "", lastName: "", email: "", phone: "", governorate: "", city: "", profession: "", reviews: [], rateAvg: "")
    func ViewTechProfile(token : String, id : Int){
        guard let url = URL(string: "https://servizi.seifahmed.com/user/gettechnician?id=\(id)") else {
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
                    print(talaaa.city)
                    self.JsonData = talaaa
                print(self.JsonData)
                
                }
            
       } catch {
        print(error.localizedDescription)
        print(String(describing: error))
                }
        
             }.resume()
    
        }
        
        
    }
    

