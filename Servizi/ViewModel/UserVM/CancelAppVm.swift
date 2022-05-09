//
//  CancelAppVm.swift
//  Servizi
//
//  Created by Tala Sadeq on 4/17/22.
//

import Foundation
import SwiftUI
class CancelingApp : ObservableObject {
    
    struct response : Codable {
        var msg : String
    }
    
    var appId : Int = 0
    @Published var JsonData = response(msg: "")
    func cancelling (token : String ,appId : Int, completion : @escaping(Result<String,Error>)->Void){
        guard let url = URL(string: "https://servizi.seifahmed.com/user/cancelappointment?id=\(appId)")
        else {
            print("Invalid Url")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.addValue(token, forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { data, _, _ in
        do {
                
             let received = try JSONDecoder().decode(response.self, from: data!)
                DispatchQueue.main.async {
                self.JsonData = received
                print(self.JsonData)
                }
            
       } catch {
                print(error.localizedDescription)
                }
        
             }.resume()
    
        
        
        
        
        
    }
    
    
    
}
