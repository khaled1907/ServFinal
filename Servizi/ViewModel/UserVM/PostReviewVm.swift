//
//  PostReviewVm.swift
//  Servizi
//
//  Created by Tala Sadeq on 5/1/22.
//

import Foundation
import SwiftUI
class PostReview : ObservableObject{
    
    struct Rate : Codable {
        var content : String
        var rate : Int
        var appointmentId : Int
         
    }
    struct response : Codable {
        var msg : String
    }
    
    @Published var JsonData = response(msg: "")
    @Published var successAlert : Bool = false
    @Published var FailedAlert : Bool = false
    @Published var loading : Bool = false
    
    func PostReview(content : String , rate : Int , appointmentId : Int , token : String){
        guard let url = URL(string: "https://servizi.seifahmed.com/user/postreview") else {
                   print("Error: cannot create URL")
                   return
               }
        
        let body = Rate(content: content, rate: rate, appointmentId: appointmentId)
        
        guard let jsonData = try? JSONEncoder().encode(body) else {
                    print("Error: Trying to convert model to JSON data")
                    return
                }
 
        self.loading = true
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
       request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.addValue(token, forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { data, resp, error in
                    guard error == nil else {
                        print("Error: error calling PUT")
                        print(error!)
                        self.FailedAlert = true
                        self.loading = false
                        self.successAlert = false
                        return
                        
                    }
            guard let resp = resp as? HTTPURLResponse else {return}
            print(resp.statusCode)
            do {
                    
                 let received = try JSONDecoder().decode(response.self, from: data!)
                    DispatchQueue.main.async {
                    self.JsonData = received
                    print(self.JsonData)
                        if(resp.statusCode != 201)
                        {
                            self.FailedAlert = true
                            self.loading = false
                            self.successAlert = false
                        }
                        else {
                            self.FailedAlert = false
                            self.loading = false
                            self.successAlert = true
                        }
                    }
                
           } catch {
            print(error.localizedDescription)
            print(String(describing: error))
            self.FailedAlert = true
            self.loading = false
            self.successAlert = false
            
            
                    }
            
     
        }.resume()
        
        
    }
    
}


