//
//  getTechniciansVm.swift
//  Servizi
//
//  Created by Tala Sadeq on 4/17/22.
//

import Foundation
import SwiftUI
class ViewingAppointmentsVM : ObservableObject {
    
// Viewing the user appointments when appointments is tapped
    struct response : Codable {
        var msg : String
        var appointments : [Appointments]
        
    }
    
    struct Appointments : Codable {
        var id : Int
        var date : String
        var duration : String
        var description : String
        var reviewed : Int
        var status : String
        var technician : Technicians
    }
    
    struct Technicians : Codable {
     var firstName : String
        var lastName : String
        var phone : String
        var governorate : String
        var city : String
        var profession : String
        
        
 }
    enum States {
        case loading
        case loaded
        case Empty
        case Error }
    
    @Published var JsonData = response(msg: "", appointments: [])
    @Published var state : States = .loading
    func ViewAppointments(token : String){
        
        guard let url = URL(string: "https://servizi.seifahmed.com/user/allappointments") else {
        print("Invalid Url")
        return
            
        }
        var request = URLRequest(url: url)
        request.addValue(token, forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { data, _, _ in
        do {
                
             let decoded = try JSONDecoder().decode(response.self, from: data!)
                DispatchQueue.main.async {
                self.JsonData = decoded
                print(self.JsonData)
                    if(decoded.appointments.isEmpty == true)
                    {
                        self.state = .Empty
                        print(self.state)
                    }
                    else {
                        self.state = .loaded
                        print(self.state)
                    }
                }
            print(self.state)
       } catch {
        print(String(describing: error))
        //print(error.localizedDescription)
        self.state = .Error
        print(self.state)
                }
        
             }.resume()
    
        }
    
     }
