//
//  SwiftUIView2.swift
//  Servizi
//
//  Created by khaled on 5/9/22.
//

import SwiftUI

struct sheetView2: View {
    @State var showRatee = false
    @Environment(\.presentationMode) var presentationMode

    @State var postreview = PostReview()
    
  @Binding var datatopreview : TechAppointmentsVM.Appointments

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
                HStack
                {
             
               Text("\(datatopreview.user.firstName + " " + datatopreview.user.lastName )")
                    .bold()
                Spacer()
                }.padding()
                HStack{
            
                
                    
                   Text(datatopreview.user.phone)
                    Spacer()
                }.padding()
              
                        
                
               
              
            
            }
            .frame(height: gentRect().width / 3)
            .frame(width: gentRect().width / 2)
           
            
            
        }.frame(width: gentRect().width - gentRect().width / 7,alignment: .leading)
        .background(Color(UIColor(named: "scroll_view _n_1")!))
        .cornerRadius(20)
        .padding()
        .shadow(radius: 10)
      
            HStack{
                Group{
                VStack{
               Group{
                Text("ID :")
                    .bold()
                    .font(.headline)
                    Spacer()
                    .padding()
                        }
                Group{
                Text(" Date: ")
                    .bold()
                    .font(.headline)
                    Spacer()
                    .padding()
                        }
                Group{
                Text(" Duration: ")
                    .bold()
                   Spacer()
                    .padding()
                        }
                Group{
                Text("  Description: ")
                    .bold()
                    Spacer()
                    .padding()
                        }
                Group{
                Text("Status: ")
                    .bold()
                    Spacer()
                    .padding()
                        }
            Group{
             Text(" Location: ")
                    .bold()
                    Spacer()
                    .padding()
                        }
                  
                }
                }
                VStack(){
                    Group
                    {
                       Text("\(datatopreview.id)")
                        Spacer()
                        .padding()
                    }
                    Group
                    {
                    Text("\(datatopreview.date)")
                        Spacer()
                        .padding()
                    }
                    Group
                    {
                    Text("\(datatopreview.duration)")
                        Spacer()
                        .padding()
                    }
                    Group
                    {
                        
                    Text("\(datatopreview.description)")
                        .font(.callout)
                        Spacer()
                        .padding()
                    }
                    Group
                    {
                    Text("\(datatopreview.status)")
                        Spacer()
                        .padding()
                    }
                    Group
                    {
                    Text("\(datatopreview.address)")
                        Spacer()
                        .padding()
                    }
                
                }
                .frame(alignment: .leading)
               
                        
            Spacer()
                }
            .frame(width: gentRect().width - gentRect().width / 7)
            
            .background(Color(UIColor(named: "scroll_view _n_1")!))
            .cornerRadius(20)
            .shadow(radius: 10)
        if ( datatopreview.status == "inprogress"){
        HStack{
            Button("Reject Order")
            {
             
            
            }
            .scaledToFit()
         .minimumScaleFactor(0.5)
            .frame(width: gentRect().width / 3 ,height: gentRect().height / 20)
         .background(Color(UIColor(named: "color10")!))
           .foregroundColor(.black)
            .cornerRadius(10)
         
//--------------------------------------------------------
            Button("Accept Order")
            {
             
            
            }
            .font(.headline)
            .scaledToFit()
         .minimumScaleFactor(0.5)
            .frame(width: gentRect().width / 3 ,height: gentRect().height / 20)
         .background(Color(UIColor(named: "bColor")!))
           .foregroundColor(.black)
            .cornerRadius(10)

       
        }.padding()
        }
        if ( datatopreview.status == "accepted"){
        HStack{
            
            Button("Mark as completed")
            {
               
          
            
            
           
            
            }
                .font(.headline)
               .scaledToFit()
            .minimumScaleFactor(0.5)
                .frame(width: gentRect().width / 2.5 ,height: gentRect().height / 20)
                .background(Color(UIColor(named: "bColor")!))
                .foregroundColor(.black)
                .cornerRadius(10)
         
            
       
        }.padding()
        }
        
        
        if ( datatopreview.status != "accepted" &&  datatopreview.status != "inprogress"){
        
        
        
        HStack{
          
             Text("")
            
            }
            .font(.headline)
            .frame(height: gentRect().height / 20)
           .foregroundColor(.black)
            .cornerRadius(10)
       
        .padding()
        
        
      }
      
        
      
        }
            
        }
        .frame(width: gentRect().width - gentRect().width / 10,  alignment: .top)
       
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
                    RateingVeiwToOrder(appid : datatopreview.id)
                    }
       

                }
                    }.padding(.top, gentRect().width / 2.5)
                }.background(Color.black.opacity(0.5).edgesIgnoringSafeArea(.all))
                
            }
    }
        

        
    }
}

struct sheetView2_Previews: PreviewProvider {
    static var previews: some View {
        sheetView2(datatopreview:  .constant(TechAppointmentsVM.Appointments(id: 0, date: "", duration: "0", description: "", address: "", reviewed: 0, status: "", user: TechAppointmentsVM.User(firstName: "", lastName: "", phone: "", governorate: "", city: ""))))
    }
}
