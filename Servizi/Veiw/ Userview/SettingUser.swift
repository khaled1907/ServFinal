
                            
 import SwiftUI
                            
struct SettingUser: View
{
    @State var showbo = false
    @State var isActive10:Bool = false
    @State var isActive11:Bool = false
    @State var index = 2
    @StateObject var ViewModel = UpdatingAddress()
    @StateObject var LogoutVm = SharedViewModel()
    @EnvironmentObject var Connector : Connecter
    @State var logOutNow : Bool = false
    @State var logOutAlert : Bool = false
    @State  var showToast = true
    
    var body: some View
    {
        
        NavigationView{
            ZStack{
                
                
                VStack{
                    
                    VStack{
                        
                        HStack
                        {
                            Text(" Settings ")
                                .foregroundColor(.blue)
                                .font(.title)
                                .bold()
                        }
                    }.padding(.top, gentRect().height / 25)
                    
                    
                    
                    VStack
                    {
                        HStack
                        {
                            Image(systemName: "person.fill")
                                .resizable()
                                
                                .scaledToFit()
                                .foregroundColor(.gray)
                                .padding(.leading, 25)
                            
                            Text("My Account")
                                .font(.title3)
                                .bold()
                                .padding(.leading, 25)
                            Spacer()
                        }.frame(width: gentRect().width - 30, height: gentRect().height / 40)
                    }.frame(width: gentRect().width - 30, height: gentRect().height / 17)
                    .background(Color(UIColor(named: "scroll_view _n_1")!))
                    .cornerRadius(10, antialiased:  true)
                    .shadow(radius: 10)
                    
                    
                    
                    
                    VStack{
                        HStack
                        {
                            Image(systemName: "location.fill")
                                .resizable()
                                
                                .scaledToFit()
                                .foregroundColor(.gray)
                                .padding(.leading, 25)
                            
                            
                            Text("Edit Address")
                                .font(.title3)
                                .bold()
                                .padding(.leading, 25)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .minimumScaleFactor(3)
                                .foregroundColor(Color.gray)
                                .font(Font.system(size: 20, weight: .bold))
                                .padding(.trailing,gentRect().height / 60)
                        }.frame(width: gentRect().width - 30, height: gentRect().height / 40)
                    }.frame(width: gentRect().width - 30, height: gentRect().height / 17)
                    .background(Color(UIColor(named: "scroll_view _n_1")!))
                    .cornerRadius(10, antialiased:  true)
                    .shadow(radius: 10)
                    .onTapGesture {
                        self.showbo = true
                    }
                    
                    Group{
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                    Group{
                        VStack{
                            HStack
                            {
                                Image(systemName: "square.and.arrow.up")
                                    .resizable()
                                    
                                    
                                    
                                    .scaledToFit()
                                    .foregroundColor(.red)
                                    .rotationEffect(Angle(degrees: 90.0))
                                    .padding(.leading, 25)
                                
                                
                                
                                Text(" Log Out ")
                                    .font(.title3)
                                    .foregroundColor(.red)
                                    .padding(.leading, 25)
                                Spacer()
                            }.frame(width: gentRect().width - 30, height: gentRect().height / 40)
                        }.frame(width: gentRect().width - 30, height: gentRect().height / 17)
                        .background(Color(UIColor(named: "scroll_view _n_1")!))
                        .cornerRadius(10, antialiased:  true)
                        .shadow(radius: 10)
                        .onTapGesture {
                            // logout function
                            //Alert
                            
                           self.logOutAlert = true
                          // LogOutAlert()
                           // Connector.logOutAlert = true
                            
                        }
                        HStack{
                            
                            Text("V 1.0.0 ")
                                .padding(.leading, 25)
                            Spacer()
                        }
                    }
                    Section{
                        NavigationLink( destination: Orderss(),
                                        isActive: self.$isActive11)
                        {
                            Text("")
                        }
                        NavigationLink( destination: TechnicainHomeView(),
                                        isActive: self.$isActive10)
                        {
                            Text("")
                        }
                        
                        NavigationLink( destination: FirstView(),
                                        isActive: self.$Connector.logOutNow)
                        {
                            Text("")
                        }
                        
                        
                        
                        
                        HStack
                        {
                            Button(action: {
                                self.isActive10 = true
                                withAnimation(.spring()){
                                    index = 0
                                }
                            })
                            {
                                VStack(spacing:10){
                                    
                                    Image(systemName: "homekit")
                                        .foregroundColor(index == 0 ? .blue : .primary)
                                    
                                    Text("Home")
                                        .font(.system(size: 20))
                                        .fontWeight(.bold)
                                        .foregroundColor(index == 0 ? .blue : .primary)
                                    
                                    
                                }     .frame(width: gennntRect().width/3)
                            }
                            
                            Button(action: {
                                withAnimation(.spring()){
                                    self.isActive11 = true
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
                    
                    
                } .frame(width: gentRect().width  , alignment : .top)
                .background(Color(UIColor(named: "buttons_colors")!))
                .navigationBarHidden(true)
                
                if self.showbo{
                    GeometryReader{_ in
                        VStack{
                            alerrrt(showbo : $showbo)
                            
                            Button(action: {
                                
                                self.showbo.toggle()
                                
                            }){
                                Image(systemName: "xmark").resizable()
                                    .frame(width: 15, height : 15 )
                                    .foregroundColor(.black)
                                    .padding(20)
                                
                            }
                            .background(Color.white)
                            .clipShape(Circle())
                            .padding(.top,25)
                            .padding(.leading ,    gentRect().height / 9.5)
                            
                        }.padding(.top, gentRect().height / 5.5)
                        
                    }.background(Color.black.opacity(0.5).edgesIgnoringSafeArea(.all))
                    
                }
                
                if(Connector.loadNow == true){
                    LoadingView()
                }
                if(Connector.Failed == true){
                    FailedAlert()
                }
                if(Connector.Successful == true){
                    SuccessAlert()
                }
            }
          
            
            
            
        }.navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
       
    }
}
                            
struct SettingUser_Previews: PreviewProvider {
    static var previews: some View {
        SettingUser()
            .preferredColorScheme(.light)
    }
}

struct alerrrt: View {
@StateObject var tvm = TechnicianSignUpModel()
@State var valueforGav = "Suez"
@State var valueforCity = "Arbaeen"
  // send valueforgav & valueforcity to api
@State var placeholderforGov = "Suez"
@State var placeholderforCity = "Arbaeen"
@State var valueforprofession = "Carpenter"
@State var placeholderforprofession = "Carpenter"
@StateObject var ViewModel = UpdatingAddress()
@State var defs = UserDefaults.standard
@State var retreivedToken = ""
@State var beartoken = ""
@State var showToast = true
@Binding var showbo : Bool
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

@EnvironmentObject var shared : Connecter
var body: some View {
    ZStack{
        
VStack{
VStack{
VStack (alignment: .leading  , spacing: 8) {
    
    
    Text("Government")
    
      
        .foregroundColor(.black)
        .padding(.leading, gentRect().height / 60)
       // .scaledToFit()
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
.padding()

Divider()
    .frame(width: 200 , height : 0.9)
    .background(Color.white)
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
.padding()



VStack{
   
    Button(action: {
        retreivedToken = defs.object(forKey: "StoredToken") as! String
        beartoken = "Bearer-- \(retreivedToken)"
        print(valueforGav)
        print(valueforCity)
        print(retreivedToken)
        ViewModel.UpdateAddress(governorate: valueforGav, city: valueforCity, token: beartoken)
        self.showbo = false
        
         
       
    },
           label:
            {
                Text("UPDATE LOCATION")
               
                    .bold()
                    .frame(width : gentRect().width / 2.2 ,height: gentRect().height / 30 )
                    .padding()
                    .font(.title2)
                .scaledToFit()
                    .minimumScaleFactor(0.5)
                   
                    .background(Color(UIColor(named: "bColor")!))
                   .foregroundColor(.white)
                    .cornerRadius(40)
                    .shadow(color: .white, radius: 1, x: 4, y: 2)
                   
                   
                
            })
             
}

.padding(.bottom,     gentRect().height / 30)
}.background(Color(UIColor(named: "bColor")!))
    
}
.frame(width:gentRect().width - gentRect().width / 3.6)
.cornerRadius(20)
.padding(.leading ,    gentRect().height / 9.5)
.padding(.top , gentRect().height / 17)




       
        
    }
    
    
}
    
}


struct SuccessAlert : View {
   // @StateObject var ViewModel = UpdatingAddress()
    @State var showAlert = true
    @State private var showToast = true
    var body: some View{
        ZStack{
           
        }
        /*
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Successful"), message: Text("Operation Went Successfully"), dismissButton: .default(Text("OK")))
        }
        */
        .toast(message: "Successful Operation ",
               isShowing: $showToast,
               duration: Toast.short)
    }
    
}

struct FailedAlert : View {
    @State var showAlert = true
    @State private var showToast = true
    var body: some View{
        ZStack{
            
        }
        /*
        .alert(isPresented: $showAlert) {
   Alert(title: Text("Failed"), message: Text("Operation Failed"), dismissButton: .default(Text("Try Again!!")))
       }*/
        .toast(message: "Failed Operation, Try again!",
               isShowing: $showToast,
               duration: Toast.short)
        
    }
    
}

struct LogOutAlert : View {
    @State var showAlert = true
    @StateObject var LogOutVm = SharedViewModel()
    @EnvironmentObject var connecter : Connecter
    var body: some View{
        ZStack{
            
        }
        .alert(isPresented:$connecter.logOutAlert) {
                        Alert(
                            title: Text("Are"),
                            message: Text("Try logging in Again !"),
                            primaryButton: .destructive(Text("Retry")) {
                                LogOutVm.logout()
                                connecter.logOutNow = true
                                
                            },
                            secondaryButton: .default(Text("Cancel"))
                        
                        )
            
            
        }
        
    }
    
}
