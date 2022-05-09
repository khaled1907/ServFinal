//
//  FirstPageInApp.swift
//  Servizi
//
//  Created by khaled on 2/28/22.
//

import SwiftUI

struct FirstPageInApp: View {
    
    @State private var isActive: Bool = false
    @State private var isActive1: Bool = false
    @State private var isActive2: Bool = false
    
    
 var body: some View {
    
NavigationView{
  
    VStack(spacing:22){
      
        HStack()
       {
         Image("welcomePic")
                .resizable()
           .scaledToFit()
            .aspectRatio(contentMode: .fit)
            .offset( y: -geeetRect().height / 18 )
            .frame(width:geeetRect().width)
        }

      
       
     

          VStack{
                  NavigationLink( destination: testingVeiw(),
                    isActive: self.$isActive){
                    Text("")
                  }
                    Button("             User             ")
                    {
                        self.isActive = true
                    }.font(.title)
                    .background(Color(UIColor(named: "bColor")!))
                    .foregroundColor(.white)
                    .cornerRadius(15)
            
                    
                    
                    NavigationLink( destination: TestingViewForTechnician(),
                      isActive: self.$isActive1)
                    {
                      Text("")
                    }

            
            Button("         Technician      ")
                      {
                          self.isActive1 = true
                      }.font(.title)
                      .background(Color(UIColor(named: "bColor")!))
                      .foregroundColor(.white)
                      .cornerRadius(15)
  }
            
        
        NavigationLink( destination: login(),
          isActive: self.$isActive2)
        {
          Text("")
        }
            
       .frame( height: geeetRect().height / 3)
        .overlay(
        
            VStack{
            Text("By creating an account you agree to")
                Text("our Terms and PrivacyPolicy")
 
            }
            .foregroundColor(.blue)
            .font(.caption)
            .frame(height:geeetRect().height / 3)
            .frame(width: geeetRect().width)
            ,alignment: .bottom
        )
    }
    
    .frame(width: geeetRect().width)
 .frame(height: geeetRect().height )
       
    
    .navigationBarHidden(true)
}
.navigationBarBackButtonHidden(true)
.navigationBarHidden(true)
.frame(height: geeetRect().height - geeetRect().height / 25)
.frame(width: geeetRect().width)
.accentColor(.black)


}
    
}


struct FirstPageInApp_Previews: PreviewProvider {
    static var previews: some View {
        FirstPageInApp()
    }
}



extension View{
    func geeetRect()->CGRect{
        return UIScreen.main.bounds
 }
    // getting safa area
    func geeetSafeArea()->UIEdgeInsets{
        return UIApplication.shared.windows.first?.safeAreaInsets
?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}

