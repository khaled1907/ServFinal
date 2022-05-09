//
//  BookingVm.swift
//  Servizi
//
//  Created by Tala Sadeq on 4/17/22.
//

import Foundation
import SwiftUI


struct Appointment : Codable{
    var date : String
    var duration : String
    var description : String
    var address : String
    var technicianId : Int
}

struct response : Codable {
    var msg : String
    var appointmentId : Int
}



class BookingViewModel : ObservableObject {
    // When Book Button is clicked

  
    func Booking(token : String ,date : String , duration : String , description : String ,address : String, technicianId :Int){
            guard let url = URL(string: "https://servizi.seifahmed.com/user/createapp")else {
                print("Error in Url")
                return
            }
            let body = Appointment(date: date, duration: duration, description: description, address: address, technicianId: technicianId)
            
            var request = URLRequest(url: url)
             
            request.setValue(token, forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try? JSONEncoder().encode(body)
            request.httpMethod = "POST"
            URLSession.shared.dataTask(with: request) { (data , resp , error) in
                if let error = error {
                    print("Server Error",error)
                    return }
                guard let resp = resp as? HTTPURLResponse else { return }
                print(resp.statusCode)
                
               // if (resp.statusCode == 201)
              //  {
                    do{
                   // print("success , status code 201")
                    guard let decoded = try? JSONDecoder().decode(response.self, from: data!)
                    else {
                        print("error in decoding")
                        return
                    }
                    print(decoded.msg)
                }
              //  else {
                    catch{
                    print("status code not 201")
                    print(String(describing: error))
                }
            
                
                
                
                
                
                
                
            }.resume()
        
        
    }
    
    
 
    
}
