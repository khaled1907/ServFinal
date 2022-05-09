//
//  TestingViewForTechnician.swift
//  Servizi
//
//  Created by khaled on 3/21/22.
//

import SwiftUI

struct TestingViewForTechnician: View {
    @State private var isActive: Bool = false
    @State private var isActive1: Bool = false
    @State var MaxCircleHight : CGFloat = 0
    @State var showSignUp = false
    @State var index = 0
    @Namespace var name
    var body: some View
    {
 
    VStack( spacing:25){

            HStack{
                        Image("number2")
                            .resizable()
                            .scaledToFill()
                           // .scaledToFit()
                    }
                    .frame(width:gentRect().width )
            .frame(height:  gentRect().height / 4.9)


  
    
            HStack
            {
                
                
                Button(action: {
                    withAnimation(.spring()){
                        index = 0
                    }
                })
                {
                    VStack{
                        
                        Text("Login")
                            .font(.system(size: 20))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(index == 0 ? .blue : .gray)
                        ZStack{
                            Capsule()
                                .fill(Color.black.opacity(0.05))
                                .frame(height : 4 )
                            if index == 0 {
                                Capsule()
                                    .fill(Color.blue)
                                    .frame(height : 4 )
                                .matchedGeometryEffect(id: "Tab", in: name )
                                
                            }
                            
                        }
                        
                    }
                    
                    
                }
                Button(action: {
                    withAnimation(.spring()){
                        index = 1
                    }
                })
                {
                    
                    VStack{
                        
                        Text("Sign Up")
                            .font(.system(size: 20))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(index == 1 ? .blue : .gray)
                        ZStack{
                            Capsule()
                                .fill(Color.black.opacity(0.05))
                                .frame(height : 4 )
                            if index == 1 {
                                Capsule()
                                    .fill(Color.blue)
                                    .frame(height : 4 )
                                    .matchedGeometryEffect(id: "Tab", in:name )
                                
                            }
                            
                        }
                        
                        
                    }
                    
                    
                }
                
                
                
            }
            .padding(.top ,0)
        
      
            HStack{
                
                if index == 0 {
                    TechnicainLogin()
                }
                else
                {
                    TechnicianSignUp()
                }
                            }
            Spacer()
        
            
            
            
   
          
       
        }
   
        .frame(width: gentRect().width, height:gentRect().height )
    
  // }te.frame(width: gentRect().width, height:gentRect().height )

    
      
               
           
 
}
}

struct TestingViewForTechnician_Previews: PreviewProvider {
    static var previews: some View {
        TestingViewForTechnician()
    }
}
