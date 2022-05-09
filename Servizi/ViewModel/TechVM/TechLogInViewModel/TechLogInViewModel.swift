//
//  TechLogInViewModel.swift
//  Servizi
//
//  Created by Tala Sadeq on 3/23/22.
//

import Foundation
import SwiftUI

class TechLogInViewModel : ObservableObject {
    @StateObject var fromUserlogIn = userLogIn()
    
    struct TechData : Codable {
        var phone : String
        var password : String
        
    }
    
    struct response : Codable {
        var token : String?
        var expiresIn : String?
        var  Id : Int?
          }
    
var TokenIsExpired : Bool = false
func postTechData(phone : String , password : String, completion : @escaping (Result<String,Error>)->Void){
        
guard let url = URL(string: "https://servizi.seifahmed.com/auth/technician/signin")
else {
 print("Error !!! Invalid Url")
  return
        }
    let body = TechData(phone: phone, password: password)
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = try? JSONEncoder().encode(body)
    URLSession.shared.dataTask(with: request) { (data , resp , error) in
        if let error = error {
            print("Server Error",error)
            return }
        
        
    guard let resp = resp as? HTTPURLResponse else { return }
        print(resp.statusCode)
        if(resp.statusCode == 200){
            DispatchQueue.main.async {
                guard let data = data else { return }
            do{
                
                var decoded = try JSONDecoder().decode(response.self, from: data)
                print(decoded.token)
            print("Now you are logged In")
               
                }
                
                
            
            
            catch {
                print("Error ", error.localizedDescription)
            }
                
            }
        }
        else if (resp.statusCode == 401){
            print("User not authenticated")
        } else {
            print("Server Error !!")
        }
        
     
    }.resume()
}
    
 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
