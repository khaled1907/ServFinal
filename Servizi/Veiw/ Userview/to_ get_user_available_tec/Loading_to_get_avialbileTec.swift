import Foundation
import SwiftUI

struct Loadiing: View {
    @State var defs = UserDefaults.standard
    @State var retreivedToken = ""
    @State var beartoken = ""
    @StateObject var ViewModel = UserHomeViewModel()
    @EnvironmentObject var connect : Connecter
    @State var chosenprof = "carpenter"
    var body: some View {
        ScrollView{
        switch ViewModel.state {
        case .loading :
            
            VStack
                    {
                        Spacer()
                       
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.blue))
                    .scaleEffect(x: 2, y: 2)
                    .onAppear{
                        retreivedToken = defs.object(forKey: "StoredToken") as! String
                        beartoken = "Bearer-- \(retreivedToken)"
                        ViewModel.getAllAccounts(token: beartoken, chosenprof: connect.chosenprof)
                    }
                
                        Spacer()

                    }.frame( height : gentRect().height - gentRect().height / 4)
            
        case .Empty :
            CaseEmpty2()
        case .loaded :
            toshowavaliabletec(accouuuunts : ViewModel.accouuuunts)
        case .Error :
            CaseError2()
        }
        }
    }
}



struct CaseEmpty2 : View
{
    var body : some View
    {
        
        
            VStack
                    {
                        Spacer()
                        HStack
                        {
                        Spacer()
                        Text("No technicians to show")
                        .font(.title2)
                        .bold()
                        Spacer()
                        }
                        Spacer()

                    }.frame( height : gentRect().height - gentRect().height / 4)

    }
}

struct Caseloaded2 : View{
    var body : some View {
        ScrollView{
          
        Text("loaded Successfully")
        }
        
    }
    
}



struct CaseError2 : View{
    var body : some View {
        VStack
                {
                    Spacer()
                    HStack
                    {
                    Spacer()
                        Text("Error inretrieving data")
                    .font(.title2)
                    .bold()
                    Spacer()
                    }
                   
        }.frame( height : gentRect().height - gentRect().height / 4)
        
    }
    
}



struct Loadiing_Previews: PreviewProvider {
    static var previews: some View {
        Loadiing()
    }
}
