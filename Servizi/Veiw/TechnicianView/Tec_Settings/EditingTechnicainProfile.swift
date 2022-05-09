//
//  EditingTechnicainProfile.swift
//  Servizi
//
//  Created by khaled on 5/9/22.
//

import SwiftUI

struct EditingTechnicainProfile: View {
    @State private var animationAmount = 0.0

    @State var valueforGav = "Suez"
    @State var valueforCity = "Arbaeen"
    @State var placeholderforGov = "Suez"
    @State var placeholderforCity = "Arbaeen"
    @State var valueforprofession = "Carpenter"
    @State var placeholderforprofession = "Carpenter"
    @StateObject var tvm = TechnicianSignUpModel()

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
    
    @State private var isActive10: Bool = false
    @State private var isActive11: Bool = false
    @State private var isActive12: Bool = false
    @StateObject var Viewmodel = TechProfileViewModel()
    @State private var token = "Bearer-- eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZWNobmljaWFuSWQiOjI1LCJpYXQiOjE2NTE3OTUxMjYsImV4cCI6MTY1MTg4MTUyNn0.AsKQd7r47PpDu-c5y972Zlmbnl2pTmCxZpGP1N0j79I"
    @State var index = 2
    var body: some View {
      NavigationView{
        
        VStack{
           ScrollView{
                
                Group{
            VStack(){
                
                ZStack(alignment: .top){
                  
                    Image ("editingImage")
                                    .resizable()
                        .frame(width:gentRect().width , height: gentRect().height / 6)
                                    .scaledToFit()
                    HStack{
            
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: gentRect().width / 12, height: gentRect().width / 15)
                        Spacer()
                            
                    }.padding(.leading)
                    .padding(.top)
                    .onTapGesture {
                        withAnimation(){
                            animationAmount += 360
                        self.isActive12.toggle()
                        }}
                HStack(alignment: .top){
                Spacer()
                    Text("Edit Profile")
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                        .padding(.bottom,50)
                        .padding()
                    Spacer()
                }
                    
                }.background(Color(UIColor(named: "buttons_colors")!))
                
            }
            .frame(width:gentRect().width,height: gentRect().height / 5,alignment: .top)
            .overlay(
                
                ZStack{
                    Image("app image")
                        .resizable()
                        .scaledToFit()
                        
                }.frame(height: gentRect().height / 10)
                .background(Color(UIColor(named: "bColor")!))
                .cornerRadius(60)
                .offset(y: gentRect().height / 20)
            )

                }
            
            VStack (spacing: gentRect().height / 100 )
{
                    
                   
                    VStack (alignment: .leading  , spacing: 8) {
                        
                        VStack(alignment: .leading, spacing: 10){
                            
                            Text(" First name")
                          
                        
                             TextField("michel", text:$tvm.firstName)
                                 .font(.system(size: 20, weight: .semibold))
                            
                                 .padding(.top,5)
                        }    .padding(.leading, gentRect().height / 60)
                        
                    }
                    .frame( height : gentRect().height / 13)
                    .background(Color.white)
                    .cornerRadius(20)
                    Spacer()
//--------------------------------------------------------------------
                    
                    VStack (alignment: .leading  , spacing: 8) {
                        
                        VStack(alignment: .leading, spacing: 10){
                            Text(" First name")
                         
                           
                             TextField("michel", text:$tvm.lastName)
                                 .font(.system(size: 20, weight: .semibold))
                            
                                 .padding(.top,5)
                        }    .padding(.leading, gentRect().height / 60)
                    }
                    .frame( height : gentRect().height / 13)
                    .background(Color.white)
                    .cornerRadius(20)
                    Spacer()
//--------------------------------------------------------------------
                    
                    VStack (alignment: .leading  , spacing: 8) {

                        Text("Goverment")
                        
                          
                            .foregroundColor(.black)
                            .padding(.leading, gentRect().height / 60)

                            .minimumScaleFactor(3)
                        
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
                                        tvm.governorate = valueforGav
                                    }
                                }
                            } label: {
                                VStack(spacing: 10){
                                    HStack{
                                        Text(valueforGav.isEmpty ? placeholderforGov : valueforGav)
                                            .foregroundColor(valueforGav.isEmpty ? .gray : .blue)
                                            
                                        Spacer()
                                        Image(systemName: "chevron.down")
                                            .minimumScaleFactor(3)
                                            .foregroundColor(Color.blue)
                                            .font(Font.system(size: 20, weight: .bold))
                                            .padding(.trailing,gentRect().height / 60)
                                          
                                        
                                    }
                                }     .padding(.leading, gentRect().height / 60)
                                
                            }
                        }
                      
                      
                      
                       
                    }
                    .frame( height : gentRect().height / 13)
                    .background(Color.white)
                    .cornerRadius(20)
                    Spacer()
//--------------------------------------------------------------------
                  
                    VStack (alignment: .leading  , spacing: 8) {
                        
                        
                        Text("City")
                      
                            .foregroundColor(.black)
                            .padding(.leading, gentRect().height / 60)
                            .minimumScaleFactor(3)
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
                                        Spacer()
                                        Image(systemName: "chevron.down")
                                            .minimumScaleFactor(3)
                                            .foregroundColor(Color.blue)
                                            .font(Font.system(size: 20, weight: .bold))
                                            .padding(.trailing,gentRect().height / 60)
                                    }
                                }    .padding(.leading, gentRect().height / 60)
                            }
                        }
                        
                      
                        
                        

                    }
                    .frame( height : gentRect().height / 13)
                    .background(Color.white)
                    .cornerRadius(20)
                    Spacer()
                  
//--------------------------------------------------------------------
                 
                    HStack{
                        
                        Button("Update")
                        {
                           
                      
                        
                        
                       
                        
                        }
                            .font(.title3)
                           .scaledToFit()
                        .minimumScaleFactor(0.5)
                        .frame(width: gentRect().width / 3.6 ,height: gentRect().height / 20)
                            .background(Color(UIColor(named: "bColor")!))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                        .shadow(color: .white, radius: 1, x: 1, y: 3)
                        .shadow(color: .white, radius: 1, x: -1, y: 3)
                        
                   
                    }.padding()
          
              
               
                }
                .frame(width:gentRect().width - 30 )
            .shadow(radius: 10)
       
         
                
         
        
            
                
        } .background(Color(UIColor(named: "buttons_colors")!))
            Section{
                withAnimation(.spring()){
                NavigationLink( destination: SettingTechnicain(),
                                isActive: self.$isActive12 )
                {
                    Text("")
                }
                }
                NavigationLink( destination: ordersForTechnicain(),
                                isActive: self.$isActive10)
                {
                    Text("")
                }
                
                 NavigationLink( destination: TechnicainProfile_(),
                                 isActive: self.$isActive11)
                 {
                     Text("")
                 }
                
                HStack
                {
                    Button(action: {
                        self.isActive11 = true
                        withAnimation(.spring()){
                            index = 0
                        }
                    })
                    {
                        VStack(spacing:10){
                            
                            Image(systemName: "person.fill")
                                .foregroundColor(index == 0 ? .blue : .primary)
                               
                            
                            Text("Profile")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(index == 0 ? .blue : .primary)
                                
                            
                            
                        }     .frame(width: gennntRect().width/3)
                    }
                    
                    Button(action: {
                        self.isActive10 = true
                        withAnimation(.spring()){
                            index = 1
                        }
                    })
                    {
                        VStack(spacing:10){
                            
                            Image(systemName: "cart")
                                .foregroundColor(index == 1 ? .blue : .primary)
                            Text("My Orders")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(index == 1 ? .blue : .primary)
                            
                            
                        }     .frame(width: gennntRect().width/3)
                    }
                    
                    
                    Button(action: {
                        withAnimation(.spring()){
                            index = 2
                        }
                    })
                    {
                        
                        VStack(spacing:10){
                            Image(systemName: "gearshape")
                                .foregroundColor(index == 2 ? .blue : .primary)
                            Text("Settings")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(index == 2 ? .blue : .primary)
                        }
                        .frame(width: gennntRect().width/3)
                    }
                }
                .padding(.top ,0)
                .frame(width: gentRect().width ,height: gennntRect().height/10)
            }.background(Color(UIColor(named: "scroll_view _n_1")!))
        }.navigationBarHidden(true)
 
            
    }.rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 1))
     
      .navigationBarHidden(true)
      .navigationBarBackButtonHidden(true)
}
}

struct EditingTechnicainProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditingTechnicainProfile()
    }
}
