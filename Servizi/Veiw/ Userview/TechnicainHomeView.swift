//
//  TechnicainHomeView.swift
//  Servizi
//
//  Created by khaled on 3/23/22.
//



import SwiftUI
import UIKit
import Foundation

struct TechnicainHomeView: View {
    
    @State var index = 0
    @Namespace var name
    @StateObject var UserHomeVm = UserHomeViewModel()
    @EnvironmentObject var sharedProf : SharedViewModel
    @EnvironmentObject var connect : Connecter
    @State private var isActive10: Bool = false
    @State private var isActive11: Bool = false
    @State var chosenprof : String = ""
    @State private var isActive : Bool = false
    @State var goto : Bool = false
    @State var disableNow : Bool = false
    @StateObject var userloginVm = userLogIn()
    @State var defs = UserDefaults.standard
    
    
    
    var body: some View  {
        
  //  if(Date() >= defs.object(forKey: "StoredDate") as! Date)
   // {
        
      //     ExpiredView()
    //    }
        
   //     else{
        
        
        NavigationView{
        VStack (spacing:0){
            HStack{
                Section{
                    Text("")
                }.frame(width:gennntRect().width/6)
                Section
                {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(40)
                }
                .frame(width:gennntRect().width/4,height: gennntRect().width/4)
                Section
                {
                    Text("Servizi")
                        .font(.title)
                        .foregroundColor(.white)
                        .bold()
                }  .frame(width:gennntRect().width/4,height: gennntRect().width/4)
                Section
                {
                    Text( "")
                }  .frame(width:gennntRect().width/2,height: gennntRect().width/4)
            }.frame(width:gennntRect().width, height:gennntRect().height/5.5)
            .background(Image("lodz")
                            .resizable()
                            .scaledToFill()
                        
            )
            ScrollView{
                
                VStack(spacing:25){
                    NavigationLink(
                        destination: SwiftUIViewAPIContoler(),
                        isActive: self.$isActive)
                        {
                            Text("")
                        }
                    Spacer()
                    //NavigationLink("",destination : SwiftUIViewAPIContoler, isActive : $goto).hidden().opacity(0)
                    
                     Button(action: {
                        chosenprof = "Carpenter"
                        //sharedProf.chosenProf = chosenprof
                        connect.chosenprof = chosenprof
                        connect.writtenProf = "Carpenter"
                        self.isActive = true
                        //self.goto = true
                        
                        
                    }, label: {
                        HStack{
                            Image("c")
                                .frame(width:gennntRect().width/7)
                            Text("Carpenter")
                                .bold()
                                .foregroundColor(.primary)
                                .font(.title2)
                            Text("")
                                .frame(width:gennntRect().width/2)
                        }  .frame(width:gennntRect().width - gennntRect().width/29,height: gennntRect().height/16)
                    }
                    )
                    
                    .background(Color(UIColor(named: "scroll_view _n_1")!))
                    .cornerRadius(15)
                    //*********************************************************************
                    Button(action: {
                        chosenprof = "plumber"
                        //sharedProf.chosenProf = chosenprof
                        connect.chosenprof = chosenprof
                        connect.writtenProf = "Plumber"
                        self.isActive = true
                    }, label: {
                        HStack{
                            Image("p")
                                .frame(width:gennntRect().width/7)
                            Text("  Plumber")
                                .bold()
                                .foregroundColor(.primary)
                                .font(.title2)
                            Text("")
                                .frame(width:gennntRect().width/2)
                        }  .frame(width:gennntRect().width - gennntRect().width/29,height: gennntRect().height/16)
                    }
                    )
                    .background(Color(UIColor(named: "scroll_view _n_1")!))
                    .cornerRadius(15)
                    //*********************************************************************
                    Button(action: {
                        chosenprof = "airconditioning"
                        //sharedProf.chosenProf = chosenprof
                        connect.chosenprof = chosenprof
                        connect.writtenProf = " AC "
                        self.isActive = true
               
                    }, label: {
                        HStack{
                            
                            Image("a")
                                .frame(width:gennntRect().width/7)
                            Text("Air Conditioning")
                                .bold()
                                .foregroundColor(.primary)
                                .font(.title2)
                            Text("")
                                .frame(width:gennntRect().width/2.9)
                        }  .frame(width:gennntRect().width - gennntRect().width/29,height: gennntRect().height/16)
                    }
                    
                    )
                    .background(Color(UIColor(named: "scroll_view _n_1")!))
                    .cornerRadius(15)
                    //*********************************************************************
                    Button(action: {
                        chosenprof = "electrician"
                        //sharedProf.chosenProf = chosenprof
                        connect.chosenprof = chosenprof
                        connect.writtenProf = "Electrician"
                        self.isActive = true
                    }, label: {
                        HStack{
                            Image("e")
                                .frame(width:gennntRect().width/7)
                            Text("Electricain")
                                .bold()
                                .foregroundColor(.primary)
                                .font(.title2)
                            Text("")
                                .frame(width:gennntRect().width/2.2)
                        }
                        .frame(width:gennntRect().width - gennntRect().width/29,height: gennntRect().height/16)
                    }
                    )
                    .background(Color(UIColor(named: "scroll_view _n_1")!))
                    .cornerRadius(15)
                    //*********************************************************************
                    Button(action: {
                        chosenprof = "paintingwork"
                        //sharedProf.chosenProf = chosenprof
                        connect.chosenprof = chosenprof
                        connect.writtenProf = "Painting Work"
                        self.isActive = true
                    }, label: {
                        HStack{
                            Image("w")
                                .frame(width:gennntRect().width/7)
                            Text("Painting Work")
                                .bold()
                                .foregroundColor(.primary)
                                .font(.title2)
                            Text("")
                                .frame(width:gennntRect().width/2.6)
                        }
                        .frame(width:gennntRect().width - gennntRect().width/29,height: gennntRect().height/16)
                    }
                    )
                    .background(Color(UIColor(named: "scroll_view _n_1")!))
                    .cornerRadius(15)
                    //*********************************************************************
                    Button(action: {
                        chosenprof = "carmechanic"
                        //sharedProf.chosenProf = chosenprof
                        connect.chosenprof = chosenprof
                        connect.writtenProf = "Car Mechanic"
                        self.isActive = true
                    }, label: {
                        HStack{
                            Image("m")
                                .frame(width:gennntRect().width/7)
                            Text("Car Mechanic")
                                .bold()
                                .foregroundColor(.primary)
                                .font(.title2)
                            Text("")
                                .frame(width:gennntRect().width/2.4)
                        }  .frame(width:gennntRect().width - gennntRect().width/29,height: gennntRect().height/16)
                    }
                    )
                    .background(Color(UIColor(named: "scroll_view _n_1")!))
                    .cornerRadius(15)
                    //*********************************************************************
                }
            }.background(Color(UIColor(named: "buttons_colors")!))
            Section{
                            NavigationLink( destination: Orderss(),
                                            isActive: self.$isActive10)
                            {
                                Text("")
                            }
                            NavigationLink( destination: SettingUser(),
                                            isActive: self.$isActive11)
                            {
                                Text("")
                            }
                            HStack
                            {
                                
                                
                                Button(action: {
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
                                    self.isActive11 = true
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
                            .frame(width: gennntRect().width ,height: gennntRect().height/10)
                        }.background(Color(UIColor(named: "scroll_view _n_1")!))
            
            
            
            
            
            
            
            
            
        }
        .navigationBarHidden(true)
        }
            
        
        
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
        //comment the next one if error
    //}
    
}
struct TechnicainHomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            TechnicainHomeView()
                .preferredColorScheme(.dark)
            TechnicainHomeView()
                .preferredColorScheme(.light)
        }
    }
}

extension View{
    func gennntRect()->CGRect{
        
        return UIScreen.main.bounds
        
    }
    
}

struct ExpiredView : View {
    @State var showingAlert = true
    @State var Navigate = false
    let defaults = UserDefaults.standard
    var body: some View{
        
      
        NavigationView{
    
    NavigationLink(destination: FirstPageInApp(),
                           isActive: self.$Navigate){
          Text("").hidden()
 
            }
    .navigationBarHidden(true)
    
            
        }
    .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
 
        .alert(isPresented:$showingAlert) {
                        Alert(
                            title: Text("Login Session Expired"),
                            message: Text("Try logging in Again !"),
                            dismissButton: .destructive(Text("Retry")) {
                                self.Navigate = true
                                defaults.removeObject(forKey: "StoredToken")
                                
                            }
                        
                        )
            
            
        }
        
    }
    
}
