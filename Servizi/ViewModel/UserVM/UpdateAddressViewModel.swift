//
//  UpdateAddressViewModel.swift
//  Servizi
//
//  Created by Tala Sadeq on 5/4/22.
//

import Foundation
import SwiftUI

class UpdatingAddress : ObservableObject {
    
    struct Updated : Codable {
        var governorate : String
        var city : String
    }
    struct response : Codable {
        var msg : String
    }
    

    @Published var JsonData = response(msg: "")
    @Published var successAlert : Bool = false
    @Published var FailedAlert : Bool = false
    @Published var loading : Bool = false
    func UpdateAddress(governorate : String , city : String, token : String){
        guard let url = URL(string: "https://servizi.seifahmed.com/auth/user/locupdate") else {
                   print("Error: cannot create URL")
                   return
               }
             self.loading = true
        
        let body = Updated(governorate: governorate, city: city)
        
        guard let jsonData = try? JSONEncoder().encode(body) else {
                    print("Error: Trying to convert model to JSON data")
            self.FailedAlert = true
            self.loading = false
            self.successAlert = false
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
                        DispatchQueue.main.async{
                        self.loading = false
                        self.FailedAlert = true
                            self.successAlert = false}
                        return
                    }
            guard let resp = resp as? HTTPURLResponse else {return}
            print(resp.statusCode)
            
            do {
                    
                 let received = try JSONDecoder().decode(response.self, from: data!)
                    DispatchQueue.main.async {
                    self.JsonData = received
                    print(self.JsonData)
                        
                        
                        if(resp.statusCode != 200)
                        {
                            self.FailedAlert = true
                            self.successAlert = false
                            self.loading = false
                            
                        }
                        else {
                            self.successAlert = true
                            self.loading = false
                            self.FailedAlert = false
                        }
                    }
                
           }
            catch {
            
                    print(error.localizedDescription)
            print(String(describing: error))
            self.FailedAlert = true
            self.loading = false
            self.successAlert = false
                    }
            
     
        }.resume()
    }
    
    
    
    
    
    
    
    
    
}

