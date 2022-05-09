//
//  ordersForTechnicain.swift
//  Servizi
//
//  Created by khaled on 4/29/22.
//

import SwiftUI

struct ordersForTechnicain: View {

    @State var isActive11:Bool = false
    @State var index = 1
    @State var obj = ViewingAppointmentsVM()
    @State  var didTap1:Bool = true
    @State  var didTap2:Bool = false
    @State  var didTap3:Bool = false
    @State  var didTap4:Bool = false
    @State var didTap5:Bool = false
    @State var isActive10:Bool = false
  

    var body: some View {
     NavigationView{
            VStack{
                ZStack{
                HStack
                {
                    Text("My Orders")
                        .font(.title)
                        .foregroundColor(.black)
                       
                }
                    
                }.frame(width: gentRect().width ,height: gentRect().height / 5.9)
                .background(Color(UIColor(named: "bColor")!))
                .cornerRadius(15)
                ScrollView{
                    ScrollView(.horizontal,showsIndicators: false){
                        
                        HStack{
                            
                            
                            
                            Button(action: {
                                self.didTap1 = true
                                self.didTap2 = false
                                self.didTap3 = false
                                self.didTap4 = false
                                self.didTap5 = false
                              
                                
                                
                            })
                            {
                             Text("inprogress")
                            }
                            .frame(height: gentRect().height / 18)
                            .frame(width: gentRect() .width / 2.9)
                            .font(.title2)
                            .background(didTap1 ? Color.blue : Color(UIColor(named: "gray_light")!))
                           .foregroundColor(.black)
                            
                            
                            
                            Button(action: {
                                self.didTap1 = false
                                    self.didTap2 = true
                                    self.didTap3 = false
                                    self.didTap4 = false
                                    self.didTap5 = false
                            })
                            {
                             Text("accepted")
                            }
                            
                            .frame(height: gentRect().height / 18)
                            .frame(width: gentRect() .width / 2.9)
                            .font(.title2)
                            .background(didTap2 ? Color.blue : Color(UIColor(named: "gray_light")!))
                           .foregroundColor(.black)
                            .cornerRadius(0)
                            
                            
                            
                        
                            Button(action: {
                                    self.didTap1 = false
                                    self.didTap2 = false
                                    self.didTap3 = true
                                    self.didTap4 = false
                                    self.didTap5 = false
                                
                            }
                            )
                            {
                             Text("rejected")
                            }
                            .frame(height: gentRect().height / 18)
                            .frame(width: gentRect() .width / 2.9)
                            .font(.title2)
                            .background(didTap3 ? Color.blue : Color(UIColor(named: "gray_light")!))
                           .foregroundColor(.black)
                          
                            
                            
                            
                            
                            
                            
                            Button(action: {  self.didTap1 = false
                                    self.didTap2 = false
                                    self.didTap3 = false
                                    self.didTap4 = true
                                    self.didTap5 = false
                                
                            })
                            {
                             Text("cancelled")
                            }
                            .frame(height: gentRect().height / 18)
                            .frame(width: gentRect() .width / 2.9)
                            .font(.title2)
                            .background(didTap4 ? Color.blue : Color(UIColor(named: "gray_light")!))
                           .foregroundColor(.black)
                         
                            
                            Button(action: {
                                self.didTap1 = false
                                self.didTap2 = false
                                self.didTap3 = false
                                self.didTap4 = false
                                self.didTap5 = true
                            })
                            {
                             Text("compleyed")
                            }
                            .frame(height: gentRect().height / 18)
                            .frame(width: gentRect() .width / 2.9)
                            .font(.title2)
                            .background(didTap5 ? Color.blue : Color(UIColor(named: "gray_light")!))
                           .foregroundColor(.black)
                         
                            
                        
                       
                        }.frame(height  : gentRect().height / 18 )
                        
                     
                        
                    }
                    ScrollView
                    {
                        
       
                            if didTap1 == true {
                                
                                ListOrdersForTechnicain( choosenButton:
                                    "inprogress", nameButton: "inprogress")
                                
                          
                                }
                            
                                      else if(   self.didTap2 == true ){
                                        ListOrdersForTechnicain( choosenButton:
                                            "accepted", nameButton: "accepted")
                                         }
                                      else if(   self.didTap3 == true ){
                                        ListOrdersForTechnicain( choosenButton:
                                            "rejected", nameButton: "rejected")
                                         }
                                      else if(   self.didTap4 == true ){
                                        ListOrdersForTechnicain( choosenButton:
                                            "cancelled", nameButton: "cancelled")
                                         }
                                      else if(   self.didTap5 == true ){
                                        ListOrdersForTechnicain( choosenButton:
                                            "completed", nameButton: "completed")
                                         }
                    }
                    
                }.background(Color(UIColor(named: "buttons_colors")!))
                Section{
                    NavigationLink( destination: TechnicainProfile_(),
                                    isActive: self.$isActive10)
                    {
                        Text("")
                    }
                NavigationLink( destination: SettingTechnicain(),
                                    isActive: self.$isActive11)
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
                                
                                Image(systemName: "person.fill")
                                    .foregroundColor(index == 0 ? .blue : .primary)
                                   
                                
                                Text("Profile")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(index == 0 ? .blue : .primary)
                                    
                                
                                
                            }     .frame(width: gennntRect().width/3)
                        }
                        
                        Button(action: {
                         
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
                    .frame(width: gentRect().width ,height: gennntRect().height/10)
                }.background(Color(UIColor(named: "scroll_view _n_1")!))
           
            
            
            
            
            }
       
            
            .navigationBarHidden(true)
     }
     .navigationBarHidden(true)
     .accentColor(.black)
     .navigationBarBackButtonHidden(true)
    
    
      
    }
}

struct ordersForTechnicain_Previews: PreviewProvider {
    static var previews: some View {
        ordersForTechnicain()
    }
}
 
