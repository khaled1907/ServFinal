//
//  UpdateInfoVM.swift
//  Servizi
//
//  Created by Tala Sadeq on 5/1/22.
//

import Foundation
import SwiftUI
class UpdatingTechInfo : ObservableObject{
    
    struct request : Codable{
        var firstName : String
        var lastName : String
        var city : String
        var governorate : String
        
    }
    struct response :Codable {
        var msg : String
    }
    
    
    func postReview(firstName : String, lastName : String, city : String , governorate : String,token : String){
        
        guard let url = URL(string :"https://servizi.seifahmed.com/user/postreview") else {
            print("Invalid Url")
            return
            }
        let body = request(firstName: firstName, lastName: lastName, city: city, governorate: governorate)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(body)
        request.addValue(token, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data , resp , error) in
            if let error = error {
                print(error.localizedDescription)
                return }
            guard let resp = resp as? HTTPURLResponse else { return }
            print(resp.statusCode)
            if (resp.statusCode == 200)
            {
                print("success , status code 200")
                guard let decoded = try? JSONDecoder().decode(response.self, from: data!)
                else {
                    print("error in decoding")
                    return
                }
                print(decoded.msg)
            }
            else {
                print("status code not 201")
            }
        
        
        
        }.resume()
        
        
        
    }
   
    
    
    
    
    
    
    
    
}
