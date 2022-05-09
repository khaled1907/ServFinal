//
//  Loading.swift
//  Servizi
//
//  Created by Tala Sadeq on 5/2/22.
//

import SwiftUI

struct Loading: View {
    @StateObject var ViewModel = UserHomeViewModel()
    var body: some View {
        switch ViewModel.state {
        case .loading :
            ProgressView()
                .onAppear{
                    ViewModel.getAllAccounts(token: "Bearer-- eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjksImlhdCI6MTY1MTU4NzI2OSwiZXhwIjoxNjUxNjczNjY5fQ.hWQ3Q8ZwcBQQkugiQ0cxUymXlVkSUE13LmIbv9BMMYo", chosenprof: "carpenter")
                }
        case .Empty :
            CaseEmpty()
        case .loaded :
            Caseloaded()
        case .Error :
            CaseError()
        }
 
    }
}



struct CaseEmpty : View {
    var body : some View{
       Text("No technicians to show")
        
    }
  
}

struct Caseloaded : View{
    var body : some View {
        Text("loaded Successfully")
        
    }
    
}



struct CaseError : View{
    var body : some View {
        Text("Error inretrieving data")
        
    }
    
}



struct Loading_Previews: PreviewProvider {
    static var previews: some View {
        Loading()
    }
}
