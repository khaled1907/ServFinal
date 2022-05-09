//
//  loadingTecPROFILE.swift
//  Servizi
//
//  Created by khaled on 5/9/22.
//

import SwiftUI

struct loadingTecPROFILE: View {

    @StateObject var Viewmodel = TechProfileViewModel()
    @State var token = "Bearer-- eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZWNobmljaWFuSWQiOjI1LCJpYXQiOjE2NTIwNTY3MTMsImV4cCI6MTY1MjE0MzExM30.f4gkkkEE_LUPX1w_62reRGNjFL3gUTekROEbUBQ6YIE"
    var body: some View {
       
            switch Viewmodel.state {
        case .Loading :
           
            
            VStack
                    {
                        Spacer()
          
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.blue))
                    .scaleEffect(x: 2, y: 2)
                   .onAppear{
                    Viewmodel.getProfile(token: token)
                    }
            
                        Spacer()

                    }.frame( height : gentRect().height - gentRect().height / 3)
        
       
        case .Loaded :
            veiew_to_appear_profile(obj: Viewmodel.JsonData)
        case .Error :
            CaseError()
        }
        
    }
}

struct loadingTecPROFILE_Previews: PreviewProvider {
    static var previews: some View {
        loadingTecPROFILE()
    }
}
