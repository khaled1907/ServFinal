//
//  TechnicianSignUp.swift
//  Servizi
//
//  Created by khaled on 3/21/22.
//

import SwiftUI

struct TechnicianSignUp: View {
    //         data for choose government and city
    
@State var valueforGav = "Suez"
@State var valueforCity = "Arbaeen"
@State var placeholderforGov = "Suez"
@State var placeholderforCity = "Arbaeen"
@State var valueforprofession = "Carpenter"
@State var placeholderforprofession = "Carpenter"
    
    
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
    
    var profession_list = [  "Carpenter",
                             "Plumber",
                             "Air Conditioning",
                             "Electrician",
                             "Painter",
                             "Mechanic"]
    
    
    //                  End of comment
    
    
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
            
        return formatter
    }()

    @State  var birthDate = Date()
    @State  var biirthDate = ""
    @StateObject var TechVar = TechnicianSignUpModel()
    @StateObject var TechVm =  TechSignUpViewModel()
    @State private var showAlert = false
    @State  var number1: Bool = true
    @State  var number2: Bool = true
    @State  var number3: Bool = true
    @State  var number4: Bool = true
    @State  var number5: Bool = true
    @State  var number7: Bool = true
    @State  var number8: Bool = true
    @State var isActive10 : Bool = false
    var body: some View {
        
        ZStack{
        ScrollView {
            NavigationLink( destination: TestingViewForTechnician(),
                                            isActive: self.$isActive10)
                            {
                                Text("")
                            }
            
            VStack{
                Text("Register as Technician")
                    .font(.title)
                    .fontWeight(.bold)
                    //   .foregroundColor(.black)
                    .kerning(1.9)
                    .frame(maxWidth : .infinity , alignment: .leading)
                
                VStack (alignment: .leading  , spacing: 8, content: {
                    
                    
                    Text(" First name")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    TextField("michel", text:$TechVar.firstName)
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
                    TextField("david", text:$TechVar.lastName)
                        .font(.system(size: 20, weight: .semibold))
                        .padding(.top,5)
                    
                    
                    Divider()
                    if number2 == false
                    {
                        Text("Name Not valid, Enter more than 3 letter")
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
                    TextField("Servizi@yahoo.com", text:$TechVar.email)
                        .font(.system(size: 20, weight: .semibold))
                        .padding(.top,5)
                    
                    
                    Divider()
                    if number3 == false
                    {
                        Text("Email is not valid")
                            .foregroundColor(.red)
                        
                    }
                    else
                    {
                        Text("")
                        
                    }
                })
                .padding(.top,5)
                VStack (alignment: .leading  , spacing: 8, content: {
                    
                    
                    Text("Phone")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    TextField("0100555001", text:$TechVar.phone)
                        .font(.system(size: 20, weight: .semibold))
                        .padding(.top,5)
                    
                    Divider()
                    if number4 == false
                    {
                        Text("Phone is not valid")
                            .foregroundColor(.red)
                        
                    }
                    else
                    {
                        Text("")
                        
                    }
                })
                .padding(.top,5)
                
           
                
                VStack (alignment: .leading  , spacing: 8, content: {
                    
                    
                    Text("Government")
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
                                    TechVar.governorate = valueforGav
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
                    TextField("\(valueforGav)", text:$TechVar.governorate)
                        .disabled(true)
                        .hidden()
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
                    
                    TextField("\(valueforCity)", text:$TechVar.city)
                        .disabled(true)
                        .hidden()
                        .frame(width: 0, height: 0)
                    
                    Divider()
                })
                .padding(.top,5)
                VStack (alignment: .leading  , spacing: 8, content: {
                    
                    
                    Text("Profession")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    VStack{
                        
                        Menu {
                            ForEach(profession_list, id: \.self){ client in
                                Button(client) {
                                    self.valueforprofession = client
                     
                                }
                            }
                        } label: {
                            VStack(spacing: 10){
                                HStack{
                                    Text(valueforprofession.isEmpty ? placeholderforCity : valueforprofession)
                                        .foregroundColor(valueforprofession.isEmpty ? .gray : .blue)
                          
                                    
                                    Spacer()
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(Color.blue)
                                        .font(Font.system(size: 20, weight: .bold))
                                }
                            }
                        }
                    }

                    TextField("\(valueforprofession)", text:$TechVar.profession)
                        .disabled(true)
                        .hidden()
                        .frame(width: 0, height: 0)
                    
                    
                    Divider()
                })
                .padding(.top,5)
                
                VStack (alignment: .leading  , spacing: 8) {
                    
                   
                    DatePicker(selection: $birthDate,  in: ...Date(),displayedComponents: .date)
                            
                            
                        {
                            Text("Select your birthdate")
                                .foregroundColor(.gray)
                                .fontWeight(.bold)
                        }

                    var  biiirthDate = Date().formatDate(name: birthDate)
                 //   print(tvm.age)

                
                    TextField("\(biiirthDate)", text:$TechVar.age)
                        
                   
                        .disabled(true)
                        .hidden()
                        .frame(width: 0, height: 0)
                    Text("\(biirthDate)")
                        .foregroundColor(.blue)
                        .bold()
                
                        
                 
       
                    
                    Divider()
                   
                }
                .padding(.top,5)
               
                Group{
                    
                    
                    VStack (alignment: .leading  , spacing: 8, content: {
                        
                        
                        Text("National ID")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        TextField("12568974589562", text:$TechVar.natinalId)
                            .font(.system(size: 20, weight: .semibold))
                            .padding(.top,5)
                        
                        
                        Divider()
                        if number8 == false
                        {
                            Text("invalid national id ")
                                .foregroundColor(.red)
                            
                        }
                        else
                        {
                            Text("")
                            
                        }
                    })
                    .padding(.top,5)
                    
                    // v stack for PASSWORD
                    VStack (alignment: .leading  , spacing: 8, content: {
                        
                        
                        Text("Password")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        SecureField("************", text:$TechVar.password)
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
                        SecureField("************", text:$TechVar.confirmpassword)
                            .font(.system(size: 20, weight: .semibold))
                            
                            .padding(.top,5)
                        
                        Divider()
                        if number7 == false
                        {
                            Text("Passwords Mismatched")
                                .foregroundColor(.red)
                            
                        }
                        else
                        {
                            Text("")
                            
                        }
                    })
                    .padding(.top,5)
                    
                    
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.top, 10)
                    // button for moveing to next step
                    Button(action: {
                        biirthDate = Date().formatDate(name: birthDate)
                        print(TechVar.city)
                        print(TechVar.governorate)
                        print(TechVar.profession)
                        print(biirthDate)
                        if(Validate(usser: TechVar)){
                            TechVm.postTechData(firstName: TechVar.firstName, lastName: TechVar.lastName, email: TechVar.email, phone: TechVar.phone, city: valueforCity, governorate: valueforGav, natinalId: TechVar.natinalId, profession: valueforprofession, age: biirthDate, password: TechVar.password) { result in
                                
                            }
                        }
                        
                        
                        
                    }, label: {
                        Image(systemName: "arrow.right")
                            .font(.system(size: 24, weight:.bold))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(UIColor(named: "bColor")!))
                            .clipShape(Circle())
                          
                            .shadow(color: Color(.black).opacity(0.6), radius: 5, x: 0, y: 0)
                       
                        
                    })
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                   
                }
                
            }
            
            .padding()
        
        }
         //Loading States
            if(TechVm.isloading == true){
                
                LoadingView()
            }
            if(TechVm.SignedUp == true){
                TechnicianSignUp(isActive10 : true)
                //(isActive1 : true)
            }
            
        }.alert(isPresented: $TechVm.ShowAlert) {
            Alert(title: Text("Sign Up Error"),
                  message: Text(TechVm.description),
            dismissButton: .default(Text("Retry!"))
         )
       }
        
    }
    
    func Validate(usser : TechnicianSignUpModel ) -> Bool
    {
        var valid = true
        
        if (!stringValidator(name: usser.firstName)) {
            number1 = false
            valid = false
        }
        else{
            number1 = true
            
            
        }
        if (!stringValidator(name: usser.lastName)) {
            number2 = false
            valid = false
        }
        else{
            number2 = true
            
        }
        if (!emailValidator(email: usser.email)) {
            number3 = false
            valid = false
        }
        else{
            number3 = true
            
            
        }
        
        if (!phoneValidator(phone: usser.phone)) {
            number4 = false
            valid = false
        }
        else{
            number4 = true
            
            
        }
        
        if (!passwordValidation(password: usser.password)) {
            number5 = false
            valid = false
        }
        else{
            number5 = true
            
            
        }
        if (usser.password != usser.confirmpassword || usser.confirmpassword.isEmpty) {
            number7 = false
            valid = false
        }
        else
        {
            number7 = true
            
        }
        if (!nationaliidValidation(natinalld: usser.natinalId)) {
            number8 = false
            valid = false
        }
        else{
            number8 = true
            
            
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
        /*   /* - Password length is 8.
         2 - One Alphabet in Password.
         3 - One Special Character in Password.
         */
         let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
         return passwordTest.evaluate(with: password)
         }*/
    }
    
    
    func nationaliidValidation(natinalld: String)-> Bool {
        if (natinalld.isEmpty || natinalld.count < 10 || natinalld.count > 13)
        {
            return false
        }
        else {
            return true
            
        }
    }
}

struct TechnicianSignUp_Previews: PreviewProvider {
    static var previews: some View {
        
        TechnicianSignUp()
            .preferredColorScheme(.light)
    }
}





