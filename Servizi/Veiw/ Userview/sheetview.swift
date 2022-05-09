//
//  sheetview.swift
//  Servizi
//
//  Created by khaled on 4/26/22.
//

import SwiftUI

struct sheetview: View {
    @State var showRatee = false
    @Environment(\.presentationMode) var presentationMode

    @State var postreview = PostReview()
    
    @Binding   var lodza : ViewingAppointmentsVM.Appointments
    @StateObject var CancelVm = CancelingApp()
    @State var defs = UserDefaults.standard
    @State var retreivedToken = ""
    @State var beartoken = ""
    var body: some View {
       
        ZStack{
            ScrollView{
        VStack{
            HStack{
                ZStack{
                    Button(action: {
               presentationMode.wrappedValue.dismiss()
                      
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(9)
                            .background(Color(UIColor(named: "bColor")!))
                           
                            .mask(Circle())
                           .frame(width: gentRect().width / 10, height: gentRect().width / 10)
                            .padding()
                           
                      
                         
                         
                        
                    })
                }
                Spacer()
            }
      VStack{
     
        HStack{
        
            VStack{
          
                    Image("app image")
                        .resizable()
                        .scaledToFill()
                        .scaledToFit()
                
                
            }
         
              
            VStack
           {
              
                Text("\(lodza.technician.firstName + " "+lodza.technician.lastName )")
                        .padding()
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.blue)
                    Image(systemName: "star.fill")
                        .foregroundColor(.blue)
                    Image(systemName: "star.fill")
                            .foregroundColor(.blue)
                    Image(systemName: "star.fill")
                                .foregroundColor(.blue)
                
                    
                   Text("Rating")
                    .foregroundColor(.gray)
                }
              
                        
                
               
              
            
            }
            .frame(height: gentRect().width / 3)
            .frame(width: gentRect().width / 2)
           
            
            
        }.frame(width: gentRect().width - gentRect().width / 7,alignment: .leading)
        .background(Color(UIColor(named: "scroll_view _n_1")!))
        .cornerRadius(20)
        .padding()
      
            HStack{
                VStack(){
                Text(" Apointment ID :")
                    .bold()
                    Spacer()
                    .padding()
                Text(" Apointment Date: ")
                    .bold()
                    Spacer()
                    .padding()
                Text(" Apointment Description: ")
                    .bold()
                    Spacer()
                    .padding()
                Text("Apointment Status: ")
                    .bold()
                    Spacer()
                    .padding()
                   
                
                }  
              
                VStack(){
                  
                       Text("\(lodza.id)")
                        Spacer()
                        .padding()
                    Text("\(lodza.date)")
                        Spacer()
                        .padding()
                    Text("\(lodza.description)")
                        Spacer()
                        .padding()
                    Text("\(lodza.status)")
                        Spacer()
                        .padding()
                       
                   
                
                }
                .frame(width: gentRect().width - gentRect().width / 1.5,alignment: .leading)
               
                        
                
                }
            .frame(width: gentRect().width - gentRect().width / 7)
            
            .background(Color(UIColor(named: "scroll_view _n_1")!))
            .cornerRadius(20)
        
        if ( lodza.status != "completed"){
        HStack{
            Button(" Cancel Order")
        {
                retreivedToken = defs.object(forKey: "StoredToken") as! String
                beartoken = "Bearer-- \(retreivedToken)"
                CancelVm.cancelling(token: beartoken, appId:lodza.id) { result in
                    
                }
                
            
            }
            .font(.headline)
            .frame(width: gentRect().width / 3 ,height: gentRect().height / 20)
         .background(Color(UIColor(named: "bColor")!))
           .foregroundColor(.black)
            .cornerRadius(10)
       
        }.padding()
        }
        if ( lodza.status == "completed"){
        HStack{
            Button(" Rate Service")
            {
               
               
                self.showRatee = true
            
            
           
            
            }
            .font(.headline)
            .frame(width: gentRect().width / 3 ,height: gentRect().height / 20)
         .background(Color(UIColor(named: "bColor")!))
           .foregroundColor(.black)
            .cornerRadius(10)
       
        }.padding()
        }
        
        
        }
        }
        .frame(width: gentRect().width - gentRect().width / 10, height: gentRect().height - gentRect().height / 9, alignment: .top)
       
        .border(Color.gray, width: 5)
        .background(Color(UIColor(named: "buttons_colors")!))
        .cornerRadius(10)
            
            }
            
            if self.showRatee{
                GeometryReader{_ in
                    ZStack{
                    VStack(){
                   
                    Button(action: {

                    self.showRatee.toggle()

                    }){
                    Image(systemName: "xmark").resizable()
                    .frame(width: 15, height : 15 )
                    .foregroundColor(.black)
                    .padding(20)

                    }
                    .background(Color.white)
                    .clipShape(Circle())
                    .padding(.bottom,20)
            
                    withAnimation{
                    RateingVeiwToOrder(appid : lodza.id)
                    }
       

                }
                    }.padding(.top, gentRect().width / 2.5)
                }.background(Color.black.opacity(0.5).edgesIgnoringSafeArea(.all))
                
            }
    }
      

        
    }
    
   
}

struct sheetview_Previews: PreviewProvider {
    static var previews: some View {
        
        sheetview(lodza: .constant(ViewingAppointmentsVM.Appointments(id: 0, date: "", duration: "", description: "", reviewed: 0, status: "", technician: ViewingAppointmentsVM.Technicians(firstName: "", lastName: "", phone: "", governorate: "", city: "", profession: "")) )
        )
        .preferredColorScheme(.dark)
        
        
      
    }
}

struct RateingVeiwToOrder: View {
    @State var postreview = PostReview()
  //  @Binding var appid : Int
   @State var revcomm = ""
   @State var appid = 0
   @State  private var rating : Int?
    @State var defs = UserDefaults.standard
    @State var retreivedToken = ""
    @State var beartoken = ""
 var body: some View {
 VStack{
    
       VStack{
       
       HStack
       {
           Text(" What`s Your Rate ? ")
               .font(.title2)
               .foregroundColor(.black)
              
            Spacer()
           
           
       }
 
       HStack
       {
        ReatingVeiw(rating: $rating)
           
        Spacer()
       }.padding(.bottom,3)
           
      
           VStack
           {
               HStack{
             
               Text(" Write Review  Comment")
                   .font(.title2)
                   .foregroundColor(.black)
                   Spacer()
               }.padding(.bottom,3)
               
               VStack{
                   TextField("review", text:  $revcomm )
                   .font(.title2)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                   
              
                  
              Spacer()
               }.padding(.leading)
               .frame(width : gentRect().width - 40 )
               .frame(height:gentRect().height / 4)
      
               .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
               .cornerRadius(4, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
               
           }

            
          
            
            Spacer()
        
       }.padding()
      
      
     
    

        
        
        VStack{
           
            Button(action: {
             print("'gdggd")
           
             
            retreivedToken = defs.object(forKey: "StoredToken") as! String
            beartoken = "Bearer-- \(retreivedToken)"
                
            postreview.PostReview(content: revcomm, rate: self.rating!, appointmentId: appid , token: beartoken)
                     
            },
                   label:
                    {
                        Text("Confirm")
                       
                            .bold()
                            .frame(width : gentRect().width / 4 ,height: gentRect().height / 30 )
                            .padding()
                            .font(.title2)
                        .scaledToFit()
                            .minimumScaleFactor(0.5)
                           
                            .background(Color(UIColor(named: "bColor")!))
                           .foregroundColor(.black)
                            .cornerRadius(40)
                            .shadow(color: .black, radius: 1, x: 4, y: 2)
                           
                           
                        
                    })
            
        }
   Spacer()
        .padding(.bottom)
   }
 .frame(width : gentRect().width , height: gentRect().height / 1.8 )
   .background(Color.white)
 .cornerRadius(20)
   
 
  
}
    
}
