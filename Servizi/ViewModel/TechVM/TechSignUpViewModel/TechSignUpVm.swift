//
//  TechLogInVm.swift
//  Servizi
//
//  Created by Tala Sadeq on 3/23/22.
//

import Foundation
import SwiftUI


class TechSignUpViewModel : ObservableObject {
    
    struct Techinfo: Codable {
        
        var firstName : String
        var lastName : String
        var email  : String
        var phone : String
        var city : String
        var governorate : String
        var natinalId : String
        var profession : String
        var age : String
        var password : String
        
    }

    struct response : Codable {
        var msg : String
        var technicianId : Int
        }
        
     struct Empty: Codable {
            let msg: String
            let data: [Datum]
        }

        // MARK: - Datum
        struct Datum: Codable {
            let value, msg, param, location: String
        }
    
    
    var failedData : Empty? = nil
    var errorResponse : String? = ""
    
    @Published var SignedUp : Bool = false
    @Published var isloading : Bool = false
    @Published var ShowAlert : Bool = false
    @Published var description = ""
    func postTechData(firstName : String, lastName : String , email : String, phone : String , city : String , governorate : String, natinalId : String , profession : String , age : String , password : String ,completion : @escaping  (Result<String, Error>) -> Void){
        
        let posturl = "https://servizi.seifahmed.com/auth/technician/signup"
          guard let url = URL(string: posturl) else {
              print("Error !! URL not found")
              return
          }
        isloading = true
        let body = Techinfo(firstName: firstName, lastName: lastName, email: email, phone: phone, city: city, governorate: governorate, natinalId: natinalId, profession: profession, age: age, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { (data , resp , error) in
            if let error = error {
                print("Server Error ",error)
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
                        print(decoded.technicianId)
                        
                        self.SignedUp = true
                        self.isloading = false
                        self.ShowAlert = false
                }
                    catch let error{
                        print("Error" , error)
                        self.SignedUp = false
                        self.isloading = false
                        self.ShowAlert = true
                    }
                    
                }
                
              print("Now you can log in")
            }
            
            else if (resp.statusCode == 422){
                guard let data = data else {
                    return }
                DispatchQueue.main.async {
                    do {
                        let decoded = try JSONDecoder().decode(Empty.self, from: data)
                        print("data had a a response of 422")
                        self.failedData = decoded
                        
                        self.description = decoded.data[0].msg
                       print("E2re hada : ", self.errorResponse)
                        self.SignedUp = false
                        self.isloading = false
                        self.ShowAlert = true
                       
                    }
                    catch let error{
                        print("Error two :",error)
                        self.SignedUp = false
                        self.isloading = false
                        self.ShowAlert = true
                    }
                }
            
            }
            
        }.resume()
       
        
            
            
    }
        
        
        
    }
    
    
    
    

