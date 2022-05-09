//
//  SettingTechnicain.swift
//  Servizi
//
//  Created by khaled on 5/9/22.
//

import SwiftUI

struct SettingTechnicain: View {
    @State private var animationAmount = 0.0
    @State var showbo = false
    @State var isActive10:Bool = false
    @State var isActive11:Bool = false
    @State var isActive12:Bool = false
    @State var index = 2
    var body: some View {
        NavigationView{
            ZStack{
                
                
                VStack{
                    
                    VStack{
                        
                        HStack
                        {
                            Text(" Settings ")
                                .foregroundColor(.gray)
                                .font(.title)
                                .bold()
                        }
                    }.padding(.top, gentRect().height / 25)
                    
                    
                    
                   
                    
                    
                    
                    
                    VStack{
                        HStack
                        {
                            Image(systemName: "person.fill")
                                .resizable()
                                
                                .scaledToFit()
                                .foregroundColor(.gray)
                                .padding(.leading, 25)
                            
                            
                            Text("Edit Profile")
                                .font(.title3)
                                .bold()
                                .padding(.leading, 25)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .minimumScaleFactor(3)
                                .foregroundColor(Color.gray)
                                .rotationEffect(Angle(degrees: 270.0))
                                .font(Font.system(size: 20, weight: .bold))
                                .padding(.trailing,gentRect().height / 60)
                             
                        }.frame(width: gentRect().width - 30, height: gentRect().height / 40)
                    }.frame(width: gentRect().width - 30, height: gentRect().height / 17)
                    .background(Color(UIColor(named: "scroll_view _n_1")!))
                    .cornerRadius(10, antialiased:  true)
                    .shadow(radius: 10)
                    .onTapGesture {
                        withAnimation(.spring()){
                        self.isActive12 = true
                        }
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
                        
                        HStack{
                            
                            Text("V 1.0.0 ")
                                .padding(.leading, 25)
                            Spacer()
                        }
                    }
                    Section{
                        withAnimation(.spring()){
                        NavigationLink( destination: EditingTechnicainProfile(),
                                        isActive: self.$isActive12)
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
                    
                    
                }
                .frame(width: gentRect().width  , alignment : .top)
                .background(Color(UIColor(named: "buttons_colors")!))
                .navigationBarHidden(true)
 }
        }.rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct SettingTechnicain_Previews: PreviewProvider {
    static var previews: some View {
        SettingTechnicain()
    }
}
