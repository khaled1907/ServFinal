//
//  signUp.swift
//  Servizi
//
//  Created by khaled on 2/28/22.
//
// This is the current signup




import SwiftUI

struct signUp: View {
    // Ay uvm turn it into SignVm
    @StateObject var SignVm = UserSignUpModel()
    @StateObject var Posting = UserSignUp()
    
    @State  var number1: Bool = true
    @State  var number2: Bool = true
    @State  var number3: Bool = true
    @State  var number4: Bool = true
    @State  var number5: Bool = true
    @State  var number6: Bool = true
    @State  var isActive1: Bool = false
    @State var isloading : Bool = false
    //  data for choose government and city
        
        @State var valueforGav = "Suez"
        @State var valueforCity = "Arbaeen"
       @State var placeholderforGov = "Suez"
        @State var placeholderforCity = "Arbaeen"
        
        @State var choosenGovIs = ["Arbaeen","Ganayen","Suez","Attaka","Faisal","Port Suez P-D"]
        

        
        var govermentList = ["Cairo", "Suez", "Alexandria","Qalyubia","Giza"]
        var Suez_Cities = ["Arbaeen","Ganayen","Suez","Attaka","Faisal","Port Suez P-D"]
        var Cairo_Cities = ["15 May City","El Darb El Ahmar","Ain Shams","Amreya","Azbakeya","El Basatin","Maadi","El Marg","El Matareya","El Mokattam","New Cairo 1","New Cairo 2","New Cairo 3","El Weili","El Nozha","El Sahel","El Sharabiya","El Shorouk","El Segil","El Salam","El Sayeda Zeinab","El Tebbin","El Zaher","Zamalek","El Zawya El Hamra","Zeitoun","Bab El Sharia","Bulaq","Dar El Salam","Hada`iq El Qobbah","Helwan","Nasr City 1","Nasr City 2","Badr City","Heliopolis","Old Cairo","Manshiyat Naser","Qasr El Nil","Rod El Farag","Shubra","Tura"]
        var Alexandria_Cities = [     "Port Alexandria Police Dept",
                                      "Dekhela",
                                       "Amreya 1",
                                       "Amreya 2",
                                       "Ataren",
                                       "Gomrok",
                                      "Labban",
                                      "Mansheya",
                                       "Montaza 1",
                                      "Montaza 2",
                                       "El Raml 1",
                                     "El Raml 2",
                                       "North Coast",
                                     "Bab Sharqi",
                                      "Borg El Arab",
                                       "Karmouz",
                                      "New Borg El Arab",
                                       "Port al-Basal",
                                       "Moharam Bek",
                                      "Sidi Gaber"]
        var Qalyubia_Cities = ["El Qanater El Khayreya",
                               "Khanka",
                               "Khusus",
                               "El Ubour",
                               "Banha",
                               "Banha 1",
                               "Banha 2",
                               "Kafr Shukr",
                               "Qaha",
                               "Qalyub",
                               "Shubra El Kheima 1",
                               "Shubra El Kheima 2",
                               "Shibin El Qanater",
                               "Tukh"]
        var Giza_Cities = ["Dokki",
                           "Pyramids",
                           "Agouza",
                           "El Ayyat",
                           "El Badrashein",
                           "El Hawamdeya",
                           "Giza",
                           "El Omraniya",
                           "El Wahat El Bahariya",
                           "El Warraq",
                           "Sheikh Zayed City",
                           "El Saff",
                           "Atfeh",
                           "Talbia",
                           "Ossim",
                           "Bulaq",
                           "Imbaba",
                           "Imbaba",
                           "Kerdasa",
                           "6th of October City (1)",
                           "6th of October City (2)",
                           "6th of October City (3)"]
        //                  End of comment
    
    
    
    
    
    var body: some View {
           
        ZStack {
        ScrollView {
           //self.$isActive1
            NavigationLink( destination: testingVeiw() ,
                            isActive: self.$isActive1)
                         {
                             Text("")
                         }
          
            
            VStack{
                
                Text("Register as a User")
                    .font(.title)
                    .fontWeight(.bold)
                    
                    .kerning(1.9)
                    .frame(maxWidth : .infinity , alignment: .leading)
                
                VStack (alignment: .leading  , spacing: 8, content: {
                    
                
                    Text(" First name")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    TextField("michel", text:$SignVm.firstName)
                        .font(.system(size: 20, weight: .semibold))
                        
                        .padding(.top,5)
                    
                    Divider()
                    if number1 == false
                    {
                        Text("name not valied enter more than 3 letter")
                            .foregroundColor(.red)
                        
                    }
                    else
                    {
                        Text("")
                        
                    }
                    
                })
                .padding(.top,5)
                
                VStack (alignment: .leading  , spacing: 8, content: {
                            
                    
                    Text("Last name")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    TextField("david", text:$SignVm.lastName)
                        .font(.system(size: 20, weight: .semibold))
                        
                        .padding(.top,5)
                    
                    
                    Divider()
                    if number2 == false
                    {
                        Text("name not valied enter more than 3 letter")
                            .foregroundColor(.red)
                        
                    }
                    else
                    {
                        Text("")
                        
                    }
                })
                .padding(.top,5)
                
                VStack (alignment: .leading  , spacing: 8, content: {
                           
                    
                    Text("Email")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    TextField("Servizi@yahoo.com", text:$SignVm.email)
                        .font(.system(size: 20, weight: .semibold))
                        
                        .padding(.top,5)
                    
                    
                    Divider()
                    if number3 == false
                    {
                        Text("email is not valid")
                            .foregroundColor(.red)
                        
                    }
                    else
                    {
                        Text("")
                        
                    }
                })
                .padding(.top,5)
              
                VStack (alignment: .leading  , spacing: 8, content: {
                    ///LOOOOOKKK
                    
                    Text("Phone")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    TextField("0100555001", text:$SignVm.phone)
                        .font(.system(size: 20, weight: .semibold))
                        
                        .padding(.top,5)
                    
                    
                    Divider()
                    if number4 == false
                    {
                        Text("phone is not valid")
                            .foregroundColor(.red)
                        
                    }
                    else
                    {
                        Text("")
                        
                    }
                })
                .padding(.top,5)
                
                
                
                VStack (alignment: .leading  , spacing: 8, content: {
                    
                                
                                Text("Goverment")
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                                
                                
                                VStack{
                                    Menu {
                                        ForEach(govermentList, id: \.self){ client in
                                            Button(client) {
                                                self.valueforGav = client
                                                if(valueforGav == "Cairo"){
                                                    choosenGovIs = Cairo_Cities
                                                    valueforCity = "15 May City"
                                                    placeholderforCity = "15 May City"
                                                }
                                                else if(valueforGav == "Suez"){
                                                    choosenGovIs = Suez_Cities
                                                    valueforCity = "Arbaeen"
                                                    placeholderforCity = "Arbaeen"
                                                }
                                                else if(valueforGav == "Alexandria"){
                                                    choosenGovIs = Alexandria_Cities
                                                    valueforCity = "Port Alexandria Police Dept"
                                                    placeholderforCity = "Port Alexandria Police Dept"
                                                }
                                                else if(valueforGav == "Qalyubia"){
                                                    choosenGovIs = Qalyubia_Cities
                                                    valueforCity = "El Qanater El Khayreya"
                                                    placeholderforCity = "El Qanater El Khayreya"
                                                }
                                                else if  (valueforGav == "Giza"){
                                                    choosenGovIs = Giza_Cities
                                                    valueforCity = "Dokki"
                                                    placeholderforCity = "Dokki"
                                                }
                                                SignVm.governorate = valueforGav
                                            }
                                        }
                                    } label: {
                                        VStack(spacing: 10){
                                            HStack{
                                                Text(valueforGav.isEmpty ? placeholderforGov : valueforGav)
                                                    .foregroundColor(valueforGav.isEmpty ? .gray : .blue)
                                                Spacer()
                                                Image(systemName: "chevron.down")
                                                    .foregroundColor(Color.blue)
                                                    .font(Font.system(size: 20, weight: .bold))
                                                
                                            }
                                        }
                                    }
                                }
                                TextField("\(valueforGav)", text:$SignVm.governorate)
                                    .disabled(true)
                                    //.hidden()
                                    .frame(width: 0, height: 0)
                              
                              
                                Divider()
                })
                            .padding(.top,5)
                
                VStack (alignment: .leading  , spacing: 8, content: {
                            
                                
                                Text("City")
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                                VStack{
                                    
                                    Menu {
                                        ForEach(choosenGovIs, id: \.self){ client in
                                            Button(client) {
                                                self.valueforCity = client
                                 
                                            }
                                        }
                                    } label: {
                                        VStack(spacing: 10){
                                            HStack{
                                                Text(valueforCity.isEmpty ? placeholderforCity : valueforCity)
                                                    .foregroundColor(valueforCity.isEmpty ? .gray : .blue)
                                              /*  Text(tvm.city)
                                                    .foregroundColor(.blue)*/
                                                
                                                Spacer()
                                                Image(systemName: "chevron.down")
                                                    .foregroundColor(Color.blue)
                                                    .font(Font.system(size: 20, weight: .bold))
                                            }
                                        }
                                    }
                                }
                                
                                TextField("\(valueforCity)", text:$SignVm.city)
                                   .disabled(true)
                                   // .hidden()
                                    .frame(width: 0, height: 0)
                                
                                Divider()
                })
                            .padding(.top,5)
                
                
                
            
                
                
                // v stack for PASSWORD
                VStack (alignment: .leading  , spacing: 8, content: {
                    
                    
                    Text("Password")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    SecureField("sssssssss", text:$SignVm.password)
                        .font(.system(size: 20, weight: .semibold))
                        
                        .padding(.top,5)
                    
                    Divider()
                    if number5 == false
                    {
                        Text("password length must be more than 7")
                            .foregroundColor(.red)
                        
                    }
                    else
                    {
                        Text("")
                        
                    }
                })
                .padding(.top,5)
                
                VStack (alignment: .leading  , spacing: 8, content: {
                    
                    
                    Text("Confirm Password")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    SecureField("sssssssss", text:$SignVm.confirmpassword)
                        .font(.system(size: 20, weight: .semibold))
                        
                        .padding(.top,5)
                    
                    Divider()
                    if number6 == false
                    {
                        Text("Passwords Mismatched")
                            .foregroundColor(.red)
                        
                    }
                    else
                    {
                        Text("")
                        
                    }
                    
                  ///LOOOOOOKKKK HEEERE
                    
                    
                    
                })
                .padding(.top,5)
                
                
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.top, 10)
                // button for moveing to next step
                Button(action: {
                    
                    if(Validate(user : SignVm))
                    {
                        Posting.post(firstName: SignVm.firstName, lastName:SignVm.lastName, email: SignVm.email, phone: SignVm.phone, city: valueforCity, governorate: valueforGav, password: SignVm.password) { result in
                         
                            }
                            
                            
                   // print("City is : \(SignVm.city)")
                     }
                    
                
                       
                    
                    
                     
                
                }
                , label: {
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
            if(Posting.isloading == true){
                
                LoadingView()
            }
            if(Posting.SignedUp == true){
                signUp(isActive1 : true)
            }
    }
        .alert(isPresented: $Posting.signupAlert) {
             Alert(title: Text("Sign Up Error"),
                   message: Text(Posting.description),
             dismissButton: .default(Text("Retry!"))
          )
        }
  
        
        
    }

    func Validate(user : UserSignUpModel) -> Bool
    {
        var valid = true
        
        if (!stringValidator(name: user.firstName)) {
            number1 = false
            valid = false
        }
        else{
            number1 = true
            
            
        }
        if (!stringValidator(name: user.lastName)) {
            number2 = false
            valid = false
        }
        else{
            number2 = true
            
        }
        if (!emailValidator(email: user.email)) {
            number3 = false
            valid = false
        }
        else{
            number3 = true
            
            
        }
        
        if (!phoneValidator(phone: user.phone)) {
            number4 = false
            valid = false
        }
        else{
            number4 = true
            
            
        }
        
        if (!passwordValidation(password: user.password)) {
            number5 = false
            valid = false
        }
        else{
            number5 = true
            
            
        }
        if (user.password != user.confirmpassword || user.confirmpassword.isEmpty) {
            number6 = false
            valid = false
        }
        else
        {
            number6 = true
            
        }
        
        
        return valid
    }
    
    ////////////////////////////// it is to validate first name////////////////////////////////////////////
    func stringValidator(name: String) -> Bool {
        
        if (name.count < 3 || name.isEmpty)
        {
            return false
            
        }
        else{
            
            return true
        }
    }
    //////////////////////////////////////////////////////////////////////////////////////////////
    func emailValidator(email: String)-> Bool {
        if (email.isEmpty || email.count < 3) {
            return false
        }
        else {
            let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}" // short format
            let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
            return emailPredicate.evaluate(with: email)
        }
    }
    //******************************Validate foe phone *********************************
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



struct LoadingView : View {
    var body: some View {
        
        ZStack{
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                .scaleEffect(2)
                //.shadow(radius: 2.0)
                .frame(maxWidth : 100, maxHeight : 100)
                .background(Color.black.opacity(0.58))
                .cornerRadius(2.0)
        }
    }
    
}





struct signUp_Previews: PreviewProvider {
    static var previews: some View {
        signUp()
    }
}


