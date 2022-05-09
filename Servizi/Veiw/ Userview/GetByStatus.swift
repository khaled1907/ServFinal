//
//  nononono.swift
//  Servizi
//
//  Created by khaled on 4/18/22.
//

import SwiftUI

struct nononono: View {
    
    
   
    
   
   
    @State  var showingOptions = false
    @State  var choosenButton : String = "inprogress"
    @State  var nameButton : String = "inprogress"
    @State var defs = UserDefaults.standard
    @State var retreivedToken = ""
    @State var beartoken = ""
   
    @StateObject var obj = ViewingAppointmentsVM()
     @State  var lodza = ViewingAppointmentsVM.Appointments(id: 0, date: "emprt", duration: "", description: "", reviewed: 0, status: "", technician: ViewingAppointmentsVM.Technicians(firstName: "", lastName: "", phone: "", governorate: "", city: "", profession: ""))
    var body: some View {
    //    NavigationView{
        VStack{
   ScrollView{
    
                ForEach( obj.JsonData.appointments , id: \.id)
                { Appointments in
                     
                     
                     VStack(){
                      
                  
                        if (Appointments.status == choosenButton ){
                            
                            VStack{
                               
                            HStack{
                                
                                VStack{
                              
                                        Image("app image")
                                            .resizable()
                                            .scaledToFit()
                                    Text(Appointments.date)
                                } .frame(width: gentRect().width / 3.6, height: gentRect().height / 6)
                             
                                    
                                VStack
                               {
                                    Text(Appointments.technician.profession)
                                        .fontWeight(.bold)
                                        .padding()
                                    Text(Appointments.technician.city)
                                        .padding()
                                    Text(Appointments.duration)
                                    
                                        
                                    
                               
                                    } .frame(width: gentRect().width / 3, height: gentRect().height / 6)
                             
                                VStack{
                                    HStack
                                    {
                                    Text("ID: \(Appointments.id)")
                                    }
                                    .padding()
                                    
                                    }
                                .frame(width: gentRect().width / 3.9, height: gentRect().height / 4.5)
                           
                            }
                            .frame(width: gentRect().width-40, height: gentRect().height / 4.5)
                            
                          
                            .background(Color(UIColor(named: "scroll_view _n_1")!))
                            .cornerRadius(15)
                                
                               
                                    
                                 
                                 
                                        HStack{
                                            Text("\(nameButton)")
                                           
                                        }.foregroundColor(.white)
                                        
                                        .frame(width: gentRect().width-40, height : gentRect().height / 19)
                                        .background(Color(UIColor(named: "bColor")!))
                                        .cornerRadius(15)
                                     
                                      
                                    
                                    
                                
                              
                            }
                           
                       
                          

                        }
                    

                     }
                     .frame(width: gentRect().width-20)
                     .onTapGesture{
                        self.lodza = Appointments
                      
                        showingOptions.toggle()
                        
                     }
                    
              
                    
                     
                     
                 }
 
                       
   
                .navigationBarHidden(true)
             }     .onAppear(perform: {
                retreivedToken = defs.object(forKey: "StoredToken") as! String
                beartoken = "Bearer-- \(retreivedToken)"
                obj.ViewAppointments(token: beartoken)
                print(obj.JsonData)
                 
             }).background(Color(UIColor(named: "buttons_colors")!))
             
             
             
             
          
        }
       
      
     
        
       .popover(isPresented: $showingOptions) {
       
        
            sheetview(lodza:$lodza)
                .ignoresSafeArea()
                
              
       }
     
       
        
        
    }
   
}
   

struct nononono_Previews: PreviewProvider {
    static var previews: some View {
        nononono()
            .preferredColorScheme(.light)
    }
}

