//
//  UserSignUp.swift
//  Servizi
//
//  Created by Tala Sadeq on 3/11/22.
//

import Foundation
import SwiftUI

class UserSignUp : ObservableObject{
   // Users

struct Userinfo: Codable {
    
    var firstName : String
    var lastName : String
    var email : String
    var phone : String
    var city : String
    var governorate : String
    var password : String
}

struct response : Codable {
   var msg : String
   var userId : Int
    }
    
 struct Empty: Codable {
        let msg: String
        let data: [Datum]
    }

    // MARK: - Datum
    struct Datum: Codable {
        let value, msg, param, location: String
    }
    
   
    
// To post the data into the server you need to capture what is written in Textfield
    @Published var signupAlert : Bool = false
    @Published var description = ""
    @Published var SignedUp : Bool = false
    @Published var isloading : Bool = false
    
   func post(firstName : String , lastName : String , email : String , phone : String , city : String , governorate : String  , password : String, completion : @escaping  (Result<String, Error>) -> Void)
    {
      let posturl = "https://servizi.seifahmed.com/auth/user/signup"
        guard let url = URL(string: posturl) else {
            print("Error !! URL not found")
            return
            }
    
    let body = Userinfo(firstName : firstName , lastName : lastName , email : email , phone : phone , city :city , governorate : governorate , password : password)
    self.isloading = true
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        URLSession.shared.dataTask(with: request) { (data , resp , error) in
            
            
        if let error = error {
        print("Server Error ",error)
            //Error Here
         
        return
                }
        guard let resp = resp as? HTTPURLResponse else { return }
                print(resp.statusCode)
                if(resp.statusCode == 201)
                {
                    
                    guard let data = data else {return}
                    DispatchQueue.main.async {
                        do {
                        let decoded = try JSONDecoder().decode(response.self, from: data)
                            print("data decoded and created successfully")
                            print(decoded.msg)
                            print(decoded.userId)
                            self.SignedUp = true
                            self.isloading = false
                            
                    }
                        catch let error{
                            print("Error" , error)
                            self.isloading = false
                        }
                        
                    }
                    
                  print("Now you can log in")
                }
                
                else if (resp.statusCode == 422){
                    //Error
                    guard let data = data else {
                        return }
                    DispatchQueue.main.async {
                        do {
                            let decoded = try JSONDecoder().decode(Empty.self, from: data)
                            print("data had a a response of 422")
                            self.signupAlert = true
                            self.description = decoded.data[0].msg
                            print(String(describing: error))
                            self.isloading = false
                        }
                        catch let error{
                            self.isloading = false
                            print("Error two :",error)
                          
                        }
                    }
                
                }
                
            }.resume()
           
            
                
                
        }
    }
    
   

    
    

    


