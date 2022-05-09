//
//  UserLogIn.swift
//  Servizi
//
//  Created by Tala Sadeq on 3/10/22.
//

import Foundation
import SwiftUI
import Combine
class userLogIn : ObservableObject {
    // first user logs in then check the token, as long as token expiration date is more than current date then user will be directly directed into the profile/home page if not the login expired and logIn again
    @Published var loginAlert : Bool = false
    
    
    
    
    struct userdata : Codable {
        var phone : String
        var password : String
        
    }
    struct response : Codable {
        var token : String?
        var expiresIn : String?
        var Id : Int?
  }
    
  // @StateObject var tok = FirstViewModel()
   @Published var khodeh = ""
    @Published var Thetoken = ""
    @Published var defs = UserDefaults.standard
    @Published var isAuthenticated : Bool = false
    @Published var isExpired : Bool = false
    @Published var storedDate = UserDefaults.standard
    @Published var retreivedDate = Date()
    @Published var isloading : Bool = false
    
    func postUserdata(phone : String , password : String, completion : @escaping (Result<String, Error>) -> Void ) {
        
        // function returns the token or the error
       
        guard let url = URL(string: "https://servizi.seifahmed.com/auth/user/signin")
        else {
            print("Error !!! Invalid Url")
            return
        }
        self.isloading = true
        let body = userdata(phone: phone, password: password)
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
                DispatchQueue.main.async { [self] in
                    guard let data = data else { return }
                do{
                    
                let decoded = try JSONDecoder().decode(response.self, from: data)
                print("Now you are logged In")
                    //self.tok.StoreToken(token: decoded.token!)
                    self.isloading = false
                    self.defs.setValue(decoded.token!, forKey: "StoredToken")
                    self.khodeh = self.defs.object(forKey: "StoredToken") as! String
                    print("This is the token\(self.khodeh)")
                    self.Thetoken = "Bearer--\(self.khodeh)"
                    self.isAuthenticated = true
                    let now = Date()
                    print("the now is : \(now)")
                    let then = Calendar.current.date(byAdding:.hour , value: 5 , to: now)
                    print("the then is :\(then)")
                    self.storedDate.setValue(then, forKey: "StoredDate")
                    self.retreivedDate = self.storedDate.object(forKey: "StoredDate") as! Date
                    print("The retreivedDate is : \(self.retreivedDate)")
                    }
                catch {
                    print("Error ", error.localizedDescription)
                    self.isloading = false
                    
                }
                    
                }
            }
            else if (resp.statusCode == 401){
                print("User not authenticated")
                DispatchQueue.main.async {
                    
                
                self.isloading = false
                self.loginAlert = true
                }
            } else {
                self.isloading = false
                print("Server Error !!")
                
            }
            
         
        }.resume()
    }
    
    

     
}

