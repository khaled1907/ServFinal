//
//  veiew to appear profile.swift
//  Servizi
//
//  Created by khaled on 5/9/22.
//

import SwiftUI

struct veiew_to_appear_profile: View {
    
    
    
    
    
    
    
    
    @State private var isActive10: Bool = false
    @State private var isActive11: Bool = false
    @StateObject var Viewmodel = TechProfileViewModel()
    @State private var token = "Bearer-- eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZWNobmljaWFuSWQiOjI1LCJpYXQiOjE2NTE3OTUxMjYsImV4cCI6MTY1MTg4MTUyNn0.AsKQd7r47PpDu-c5y972Zlmbnl2pTmCxZpGP1N0j79I"
    @State var index = 0
    @State var obj = TechProfileViewModel.response(msg: "", technician: TechProfileViewModel.Technicians(firstName: "", lastName: "", email: "", phone: "", governorate: "", city: "", profession: ""), reviews: [TechProfileViewModel.Reviews(id: 0, content: "", rate: 0, technicianId: 0, userId: 0, appointmentId: 0, createdAt: "", user: TechProfileViewModel.User(firstName: "", lastName: ""))])
    var body: some View {
        NavigationView{
        
        VStack{
     ScrollView{
                
                Group{
            VStack{
                HStack{
                    Text("Porfile")
                        .foregroundColor(.white)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .padding(.bottom,50)
                        .padding()
                    Spacer()
                }
                
                
            }.frame(alignment:.top)
            .frame(width:gentRect().width,height: gentRect().height / 5)
            .background(Color(UIColor(named: "bColor")!))
            .cornerRadius(15, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            .overlay( VStack{
                
                
                
                Text("\(obj.technician.firstName)")
                    .foregroundColor(.primary)
                    .font(.title3)
                    .bold()
                Text("\(obj.technician.profession)")
                    .padding(.top,6)
                
            }
            .frame(width:gentRect().width - 60  ,height: gentRect().height / 7)
           
            .background(Color(UIColor(named: "scroll_view _n_1")!))
            .cornerRadius(20, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            .offset(y: gentRect().height / 8)
            .shadow(radius: 10)
            )
                
                ZStack{
                    Image("app image")
                        .resizable()
                        .scaledToFit()
                        
                }.frame(height: gentRect().height / 10)
                .background(Color(UIColor(named: "bColor")!))
                .cornerRadius(60)
                .offset(y: -gentRect().height / 8)
            }
                VStack
                {
//---------------------------------------------------------//
                    Group{
                    HStack
                    {
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.gray)
                        
                         Text("Full Name")
                            .font(.title3)
                            .bold()
                            .padding()
                        Spacer()
                    }.frame(width: gentRect().width - 30, height: gentRect().height / 40)
                    .padding(.leading, 25)
                    .padding(.top, 5)
                    
                    HStack
                    {
                       
                        Text("\(obj.technician.firstName) " + "\(obj.technician.lastName)")
                        .bold()
                        .font(.title3)
                        Spacer()
                    }.padding(.leading,gentRect().height / 35 )
                    
                    Rectangle()
                        .fill(Color(UIColor(named: "bColor")!))
                        .frame(width: gentRect().width - gentRect().width / 3 ,height: 1)
                        .padding()
                    }
                    Group{
                    HStack
                    {
                        Image(systemName: "envelope.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.gray)
                        
                         Text("E-mail")
                            .font(.title3)
                            .bold()
                            .padding()
                        Spacer()
                    }.frame(width: gentRect().width - 30, height: gentRect().height / 40)
                    .padding(.leading, 25)
                    
                    
                    HStack
                    {
                       
                        Text("\(obj.technician.email)")
                        .bold()
                        .font(.title3)
                        Spacer()
                    }.padding(.leading,gentRect().height / 35 )
                    
                    Rectangle()
                        .fill(Color(UIColor(named: "bColor")!))
                        .frame(width: gentRect().width - gentRect().width / 3 ,height: 1)
                        .padding()
                    }
 //--------------------------------------------------------------
                    HStack
                    {
                        Image(systemName: "location.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.gray)
                        
                         Text("Address")
                            .font(.title3)
                            .bold()
                            .padding()
                        Spacer()
                    }.frame(width: gentRect().width - 30, height: gentRect().height / 40)
                    .padding(.leading, 25)
                    
                    
                    HStack
                    {
                       
                        Text(" \(obj.technician.governorate)" + " " +   "\(obj.technician.city)")
                        .bold()
                        .font(.title3)
                        Spacer()
                    }.padding(.leading,gentRect().height / 35 )
                    
                 
                    
                    Rectangle()
                        .fill(Color(UIColor(named: "bColor")!))
                        .frame(width: gentRect().width - gentRect().width / 3 ,height: 1)
                        .padding()
//-----------------------------------------------------------
                    
                    HStack
                    {
                        Image(systemName: "iphone.homebutton")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.gray)
                        
                         Text("Mobile")
                            .font(.title3)
                            .bold()
                            .padding()
                        Spacer()
                    }.frame(width: gentRect().width - 30, height: gentRect().height / 40)
                    .padding(.leading, 25)
                    
                    
                    HStack
                    {
                       
                        Text("\(obj.technician.phone)"  )
                        .bold()
                        .font(.title3)
                        Spacer()
                    }.padding(.leading,gentRect().height / 35 )
                    .padding(.bottom , gentRect().height / 40)
                    
            
                    
            
                    
                 
                    
                }
                .frame(width:gentRect().width - 30  )
               
                .background(Color(UIColor(named: "scroll_view _n_1")!))
                .cornerRadius(20, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .padding()
                .shadow(radius: 10)
                VStack{
                    
                    HStack
                    {
                        Text("Reviews")
                            .font(.title2)
                        Spacer()
                           
                    } .padding(.top,10)
         
                    .padding(.leading,10)
                    
                 
          ForEach( obj.reviews , id: \.id)
                { review in
                    
                VStack
                {
                    
                    HStack
                    {
                        
                      
                           
                        Text( "\(review.user.firstName)" + " " + "\(review.user.lastName)" )
                            .font(.title2)
                            .bold()
                        Spacer()
                        
                        
                        
                        
                        
                        
                    }.padding(.top)
                    .padding(.leading)
                    .padding(.trailing)
                    
                    VStack{
                        
                    HStack{
                        RReatingVeiw(rating: review.rate)
                        Spacer()
                    
                        Image(systemName: "star.square.fill")
                            .resizable()
                            .frame(width: 30, height: gentRect().height / 30)
                        .foregroundColor(.accentColor)
                            
                    } .padding(.trailing)
                    .padding(.leading,10)
                    .padding(.bottom,2)
                        HStack
                        {
                            Text("\(review.content)")
                                .font(.title3)
                        }
                       .padding(.leading,10)
                        .padding(.trailing,50)
                        .padding(.bottom,2)
                      
                        HStack
                        {
                          
                    var ts = String().ToLocalStringWithFormat(x: review.createdAt)
                            Text(" Date : ")
                                .font(.title3)
                     Spacer()
                         Text("\(ts)")
                        }
                        .padding(.leading,10)
                        .padding(.trailing)
                        .padding(.bottom)
                    }
                    
                }.frame(width:gentRect().width - 60 )
                .background(Color(UIColor(named: "scroll_view _n_1")!))
                .cornerRadius(20, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .shadow(radius: 6)
                .padding()

                }
       
            }.frame(width:gentRect().width - 30 )
                .background(Color(UIColor(named: "scroll_view _n_1")!))
                .cornerRadius(20, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .shadow(radius: 10)
       
                
                
         
            Spacer()
            
                
        }   .background(Color(UIColor(named: "buttons_colors")!))
            
            
            
            
            
            
            
            Section{
                NavigationLink( destination: ordersForTechnicain(),
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
        }.navigationBarHidden(true)
            
        }.navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct veiew_to_appear_profile_Previews: PreviewProvider {
    static var previews: some View {
        veiew_to_appear_profile()
    }
}





extension Date {
    func formatDate(name:Date) -> String {
                let dateFormatter = DateFormatter()
          
            dateFormatter.dateFormat = "yyyy-MM-dd"
        
            return dateFormatter.string(from: name)
        }
    
}








struct RReatingVeiw: View {
    @State var rating : Int
    private func starType(index : Int ) -> String{
        if rating > 0 {
            return index <= rating ? "star.fill" : "star"
        }
        else {
            return "star"
        }
    }
    var body: some View {
        HStack
        {
            ForEach( 1...5 , id: \.self){ index in
                Image(systemName: self.starType(index: index))
                    .resizable()
                    
                    .foregroundColor(.blue)
                    .frame(width:gentRect().width / 20, height: gentRect().width / 20)
                    
                  
            }
        }
    }
}


extension String {
    func ToLocalStringWithFormat(x: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        let localDate = formatter.date(from: x)
        formatter.timeZone = TimeZone.autoupdatingCurrent
       formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let llocalDate = formatter.string(from: localDate!)
        return llocalDate
    }

}
