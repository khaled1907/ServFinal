//
//  TechViewAppointment.swift
//  Servizi
//
//  Created by Tala Sadeq on 5/3/22.
//

import Foundation
import SwiftUI

class TechAppointmentsVM : ObservableObject {
    
    struct response : Codable {
        var  msg : String
        var appointments : [Appointments]
    }
    struct Appointments : Codable {
        var id : Int
        var date : String
        var duration : String
        var description : String
        var  address : String
        var  reviewed : Int
        var status : String
        var user: User
        
    }
    
    struct User : Codable {
        
        var firstName : String
        var lastName : String
        var phone : String
        var governorate : String
        var city : String
    }
    enum States {
        case Loading
        case Loaded
        case Error
    }
    @Published var state : States = .Loading
    @Published var JsonData = response(msg: "", appointments: [])
    func getTechAppointments(token : String){
        guard let url = URL(string: "https://servizi.seifahmed.com/technician/allappointments") else {
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
                    if (resp.statusCode == 200){
                        self.state = .Loaded
                    }
                    else {
                        self.state = .Error
                    }
                }
            
       } catch {
        print(String(describing: error))
        //print(error.localizedDescription)
        self.state = .Error
                }
        
             }.resume()
    
        }
    
        
        
        
        
    }
    
    
    
    
    

