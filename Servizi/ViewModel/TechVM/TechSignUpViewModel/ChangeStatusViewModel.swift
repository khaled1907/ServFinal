//
//  ChangeStatusViewModel.swift
//  Servizi
//
//  Created by Tala Sadeq on 5/8/22.
//

import Foundation
import SwiftUI

struct Updated : Codable {
    var id : Int
    var status : String
    
}
struct responseOfTechStatus : Codable {
    var msg : String
}

class changeStatus : ObservableObject{
    // View Model that allows the technician to change the status of appointment from a state to another
    @Published var JsonData = responseOfTechStatus(msg : "")
    func changeStatus(id : Int , status : String,token : String){
    guard let url = URL(string: "https://servizi.seifahmed.com/auth/user/locupdate") else {
                   print("Error: cannot create URL")
                   return
               }
    let body = Updated(id: id, status: status)
    guard let jsonData = try? JSONEncoder().encode(body) else {
                    print("Error: Trying to convert model to JSON data")
                   return
               }
    var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.addValue(token, forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { data, resp, error in
            guard error == nil else {
                print("Error: error calling PUT")
                print(error!)
                return
                
            }
            guard let resp = resp as? HTTPURLResponse else {return}
            print(resp.statusCode)
            guard let data = data else {
            print("Error: Did not receive data")
            return
                        }
         
            do {
                 let received = try JSONDecoder().decode(responseOfTechStatus.self, from: data)
                    DispatchQueue.main.async {
                    self.JsonData = received
                    print(self.JsonData)
                    }
            }
            
            catch{
            print(error.localizedDescription)
            return
                }
        
        }.resume()
        
    }
    
    
}
