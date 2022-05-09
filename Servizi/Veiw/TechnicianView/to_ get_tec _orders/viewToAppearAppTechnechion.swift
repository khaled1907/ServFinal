//
//  viewToAppearAppTechnechion.swift
//  Servizi
//
//  Created by khaled on 5/9/22.
//

import SwiftUI

struct viewToAppearAppTechnechion: View {
    @State  var choosenButton : String = ""
    @State  var nameButton : String = ""
    @State var datatosheet = TechAppointmentsVM.Appointments(id: 0, date: "", duration:" 0", description: "", address: "", reviewed: 0, status: "", user: TechAppointmentsVM.User(firstName: "", lastName: "", phone: "", governorate: "", city: ""))
 
    @State  var showingOptions = false
  
    @State  var obj = TechAppointmentsVM.response(msg: "", appointments: [TechAppointmentsVM.Appointments(id: 0, date: "String", duration: "String", description: "", address: "", reviewed: 0, status: "", user: TechAppointmentsVM.User(firstName: "", lastName: "", phone: "", governorate: "", city: ""))])
    var body: some View {
        VStack{
            ScrollView{
                ForEach( obj.appointments , id: \.id)
                { Appointments in
                    
                    
                    VStack(){
                        
                        
                        if (Appointments.status == choosenButton ){
                            
                            VStack{
                                
                                HStack{
                                    
                                    VStack{
                                        
                                        Image("Shanta")
                                            .resizable()
                                            .scaledToFit()
                                        Text(Appointments.date)
                                        
                                    } .frame(width: gentRect().width / 4, height: gentRect().height / 6.9)
                                    
                                    
                                    VStack{
                                        Spacer()
                                        HStack{
                                            Text(Appointments.user.firstName + " " + Appointments.user.lastName)
                                                .fontWeight(.bold)
                                            
                                            HStack
                                            {
                                                Text("ID: \(Appointments.id)")
                                            }
                                            .padding()
                                            Spacer()
                                        }
                                        .padding(.leading)
                                        Spacer()
                                        
                                        HStack{
                                            Image(systemName: "location.fill")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width:gentRect().width / 20)
                                                .foregroundColor(.gray)
                                            Text(Appointments.address)
                                            Spacer()
                                        }
                                        .padding(.leading)
                                        Spacer()
                                        Spacer()
                                        Spacer()
                                        
                                        HStack{
                                            Text(Appointments.duration)
                                            
                                            Spacer()
                                        }
                                        .padding(.leading)
                                        Spacer()
                                        
                                    } .frame(width: gentRect().width / 1.6, height: gentRect().height / 6.5)
                                    
                                    
                                    
                                }
                                .frame(width: gentRect().width-40, height: gentRect().height / 6.5)
                                
                                
                                .background(Color(UIColor(named: "scroll_view _n_1")!))
                                .cornerRadius(15)
                                
                                
                                
                                
                                
                                HStack{
                                    Text("\(nameButton)")
                                    
                                }.foregroundColor(.white)
                                
                                .frame(width: gentRect().width-40, height : gentRect().height / 19)
                                .background(Color(UIColor(named: "bColor")!))
                                .cornerRadius(15)
                                
                                
                                
                                
                                
                                
                            }    .shadow(radius: 10)
                            
                            
                            
                            
                        }
                        
                        
                    }
                    .frame(width: gentRect().width-20)
                    .onTapGesture{
                         self.datatosheet = Appointments
                         
                         showingOptions.toggle()
                    }
                    
                    
                    
                    
                    
                }
                
                
                
                .navigationBarHidden(true)
            }     .background(Color(UIColor(named: "buttons_colors")!))
            
            
            
            
            
        }
        
        
        
        
        .popover(isPresented: $showingOptions)
        {
            
            
            sheetView2(datatopreview : $datatosheet)
               .ignoresSafeArea()
            
            
        }
        
        
        
        
    }

    }


struct viewToAppearAppTechnechion_Previews: PreviewProvider {
    static var previews: some View {
        viewToAppearAppTechnechion()
    }
}
