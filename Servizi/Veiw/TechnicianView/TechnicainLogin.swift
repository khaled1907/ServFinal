//
//  TechnicainLogin.swift
//  Servizi
//
//  Created by khaled on 3/21/22.
//

import SwiftUI

struct TechnicainLogin: View {
 
    @State var email = ""
    @State var password = ""
    var body: some View {
      
            ScrollView{
        VStack{
            Text("Login in your account ")
                .font(.title)
                .fontWeight(.bold)
              //  .foregroundColor(.black)
          
                .kerning(1.9)
                .frame(maxWidth : .infinity , alignment: .leading)
            
            // username _ password
            VStack (alignment: .leading  , spacing: 8, content: {
                        
                        
               Text("User name")
                .fontWeight(.bold)
           .foregroundColor(.gray)
                TextField("servizi22@yahoo.com", text:$email)
                    .font(.system(size: 20, weight: .semibold))
           
                    .padding(.top,5)
                
                
                Divider()
            })
            .padding(.top,25)
            // v stack for PASSWORD
            VStack (alignment: .leading  , spacing: 8, content: {
                        
                        
               Text("Password")
                .fontWeight(.bold)
                .foregroundColor(.gray)
               SecureField("123456@Servizi", text:$password)
                .font(.system(size: 20, weight: .semibold))
              //  .foregroundColor(Color(.black))
                .padding(.top,5)
           
                Divider()
            })
            .padding(.top,20)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Forgrt Password")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray)
                
                
            })
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.top, 10)
            // button for moveing to next step
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
              Image(systemName: "arrow.right")
                .font(.system(size: 24, weight:.bold))
                .foregroundColor(.white)
                .padding()
                .background(Color(UIColor(named: "bColor")!))
                .clipShape(Circle())
                // shadow
                .shadow(color: Color(.black).opacity(0.6), radius: 5, x: 0, y: 0)
          
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 10)
            
            
        }
        .padding()
            }
           
            
   
    
}
}

struct TechnicainLogin_Previews: PreviewProvider {
    static var previews: some View {
        TechnicainLogin()
    }
}
