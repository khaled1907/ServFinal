//
//  UserHomeVm.swift
//  Servizi
//
//  Created by Tala Sadeq on 4/4/22.
//

import Foundation
import SwiftUI





class UserHomeViewModel : ObservableObject {
    struct Accounts: Codable  {
        let msg: String
        let technicians: [Technician]
    }

    struct Technician: Codable , Identifiable,Hashable{
        let id: Int
        let firstName, lastName, email, phone: String
        let governorate, city, profession: String
    }
    

    enum States {
        case loading
        case loaded
        case Empty
        case Error }
    
    
    var accouuuunts = Accounts(msg:"",technicians: [])
    @Published var state : States = .loading
    
    func getAllAccounts(token : String, chosenprof : String){
         guard let url = URL(string: "https://servizi.seifahmed.com/user/alltechnicians?profession=\(chosenprof)") else {
            print("Invalid URL")
            return
         }
       
    
        var request = URLRequest(url: url)
        request.addValue(token, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, _, _ in
            do {
                
                guard let data = data else {
                                print("Error: Did not receive data")
                                return
                            }
                let accounts = try JSONDecoder().decode(Accounts.self, from: data)
                DispatchQueue.main.async {
                    self.accouuuunts = accounts
                    print(self.accouuuunts)
                    if (accounts.technicians.isEmpty == true)
                    {
                        self.state = .Empty
                    }
                    else {
                        self.state = .loaded
                    }
                    
                }
            
            } catch {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.state = .Error
                    
                }
                
                
            }
        
        }.resume()
  
         } }
/*
 
 {
     guard let url = URL(string: "https://servizi.seifahmed.com/user/alltechnicians?profession=\(chosenprof)") else {
         print("Invalid url")
         return
     }
     print(url)
     var request = URLRequest(url: url)
     request.addValue(token, forHTTPHeaderField: "Authorization")
     
     URLSession.shared.dataTask(with: request) { data, _, _ in
         do {
             
          let accounts = try JSONDecoder().decode(Accounts.self, from: data!)
             DispatchQueue.main.async {
                 self.accouuuunts = accounts
                 print(self.JsonData)
             }
         
         } catch {
             print(error.localizedDescription)
             
             
         }
     
     }.resume()
 
 }
 
 
 */

