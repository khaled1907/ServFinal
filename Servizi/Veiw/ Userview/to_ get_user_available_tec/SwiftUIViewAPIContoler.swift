//
//  SwiftUIViewAPIContoler.swift
//  ToDoList
//
//  Created by khaled on 2/9/22.
//
//Ana baheb molokhya
import SwiftUI
import Combine
class Book: ObservableObject {
@Published var title: String = ""

}


struct SwiftUIViewAPIContoler: View {
    @EnvironmentObject var connect : Connecter
    @StateObject var book = Book()
   // @State var accouuuunts  = Accounts(msg:"",technicians: [])
    @State var ViewModel = UserHomeViewModel()
    @State private var isActive: Bool = false
    @State private var isActive11: Bool = false
    @State private var isActive10: Bool = false
    @State var showbo = false
    @State var index = 0
    @Namespace var name
    
    @StateObject var defaults = userLogIn()
    @State var token = ""
    @State var finaltoken = ""
    @State var defs = UserDefaults.standard
    @State var retreivedToken = ""
    @State var beartoken = ""
    
   
    var body: some View {
        NavigationView{
                   ZStack{
                    VStack{
                        

                        HStack{
                            VStack{
                                Text (connect.writtenProf)
                                    .font(.title2)
                                   .scaledToFit()
                                    .minimumScaleFactor(0.8)
                                    .foregroundColor(.white)
                                    .frame(width: gentRect().width / 4 , alignment: .leading)
                                    
                            }
                            .frame(width : gentRect().width / 2 )
                            
                            VStack{
                                HStack{
                                    Text(connect.city)
                                    .foregroundColor(.white)
                                    .font(.title2)
                                  .scaledToFit()
                                    .minimumScaleFactor(0.8)
                                    
                                Image(systemName: "arrowtriangle.down")
                                    .foregroundColor(.white)
                                    .padding(.top,3)
                                   
                                 
                                }
                                .onTapGesture {
                                    self.showbo.toggle()
                                }
                                
                            }
                            .frame(width : gentRect().width / 2 )
                            
                        }
                        .frame(width: gentRect().width , height: gentRect().height  / 10 )
                  
                        .background(Color(UIColor(named: "bColor")!))
                       
                        VStack{
                               ZStack{
                                   Text("")
                                       .hidden()
                               }.frame(width: gentRect().width, height : 0)
                        
                     Loadiing()
                        }.background(Color(UIColor(named: "buttons_colors")!))
                            .padding(.top,-2)
                        
                        
                  
                        
                        Section{
                            NavigationLink( destination: Orderss(),
                                            isActive: self.$isActive10)
                            {
                                Text("")
                            }
                            NavigationLink( destination: SettingUser(),
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
                                        
                                        Image(systemName: "homekit")
                                            .foregroundColor(index == 0 ? .blue : .primary)
                                        
                                        Text("Home")
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
                    }
                  
                        if self.showbo{
                            GeometryReader{_ in
                            VStack{
                                alerrrt( showbo: $showbo)

                        Button(action: {
                   
                        self.showbo.toggle()
                 
                        }){
                        Image(systemName: "xmark").resizable()
                        .frame(width: 15, height : 15 )
                        .foregroundColor(.black)
                        .padding(20)

                        }
                        .background(Color.white)
                        .clipShape(Circle())
                        .padding(.top,25)
                        .padding(.leading ,    gentRect().height / 9.5)

                            }
                            }.background(Color.black.opacity(0.5).edgesIgnoringSafeArea(.all))
                            
                        }

                        
                    }
                    
                    
                    
                    
                    .navigationBarHidden(true)
          
                   
                }.navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        
       
    
        }
   
}
    





struct SwiftUIViewAPIContoler_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            SwiftUIViewAPIContoler()
                .preferredColorScheme(.dark)
            SwiftUIViewAPIContoler()
                .preferredColorScheme(.light)
        }
    }
}




/*
extension View{
    func gentRect()->CGRect{
        
        return UIScreen.main.bounds
        
    }
    
}

*/

/*
 

 book.title = "mohammmmed"
 connect.firstName = Technician.firstName
 connect.lastName = Technician.lastName
 connect.technicianId = Technician.id
 isActive = true
 
 
 
 */

/*
 
 retreivedToken = defs.object(forKey: "StoredToken") as! String
 beartoken = "Bearer-- \(retreivedToken)"
 ViewModel.getAllAccounts(token: beartoken, chosenprof: connect.chosenprof)
 
 
 
 
 
 
 
 */
