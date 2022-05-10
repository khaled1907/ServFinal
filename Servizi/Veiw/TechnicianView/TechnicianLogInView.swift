//
//  TechnicainLogin.swift
//  Servizi
//
//  Created by khaled on 3/21/22.
//

import SwiftUI

struct TechnicainLogin: View {
    //Updated Version of Technician Login
    
    @StateObject var techVm = TechLogInViewModel()
    @StateObject var techvar = TechLogInModel()
    @State  var number1: Bool = true
    @State  var number2: Bool = true
    var body: some View {
      
            ScrollView{
        VStack{
            Text(" Login ")
                .font(.title)
                .fontWeight(.bold)
              //  .foregroundColor(.black)
          
                .kerning(1.9)
                .frame(maxWidth : .infinity , alignment: .leading)
            
            // username _ password
            VStack (alignment: .leading  , spacing: 8, content: {
                        
                        
               Text("Phone Number")
                .fontWeight(.bold)
           .foregroundColor(.gray)
                TextField("01111111111", text:$techvar.phone)
                    .font(.system(size: 20, weight: .semibold))
           
                    .padding(.top,5)
                
                
                Divider()
                if number1 == false
                {
                    Text("phone is not valid")
                        .foregroundColor(.red)
                    
                }
                else
                {
                    Text("")
                    
                }
            })
            .padding(.top,25)
            // v stack for PASSWORD
            Spacer()
            VStack (alignment: .leading  , spacing: 8, content: {
                        
                        
               Text("Password")
                .fontWeight(.bold)
                .foregroundColor(.gray)
                SecureField("**********", text:$techvar.password)
                .font(.system(size: 20, weight: .semibold))
              //  .foregroundColor(Color(.black))
                .padding(.top,10)
           
                Divider()
                if number2 == false
                {
                    Text("password length must be more than 7")
                        .foregroundColor(.red)

                }
                else
                {
                    Text("")
                    
                }
            })
        
            
            Button(action: { }, label: {
                Text("Forget Password")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray)
                
                
            })
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.top, 10)
            // button for moveing to next step
            Button(action: {
                if(Validate(phone: techvar.phone, password: techvar.password)){
                    techVm.postTechData(phone: techvar.phone, password: techvar.password) { result in
                        
                    }
                }
                
            }, label: {
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
    func Validate( phone : String , password : String) -> Bool
    {
            var valid = true


        if (!phoneValidator(phone: phone)) {
        number1 = false
        valid = false
        }
        else{
        number1 = true
  

        }
        
        if (!passwordValidation(password: password)) {
        number2 = false
        valid = false
        }
        else{
        number2 = true
  

        }

return valid
}
    
    func phoneValidator(phone: String)-> Bool {
     if (phone.isEmpty || phone.count != 11) {
              return false
         } else {
             let PHONE_REGEX =  #"^\(?\d{3}\)?[ -]?\d{3}[ -]?\d{5}$"#
             let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
             return phoneTest.evaluate(with : phone)
         }
     }
 //******************************Validate foe psssword *********************************
     
     func passwordValidation(password: String)-> Bool {
         if (password.isEmpty || password.count < 8)
         {
             return false
         }
         else {
             return true
             
         }
     }
}

struct TechnicainLogin_Previews: PreviewProvider {
    static var previews: some View {
        TechnicainLogin()
    }
}
