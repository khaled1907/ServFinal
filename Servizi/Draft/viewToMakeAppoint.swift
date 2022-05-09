//
//  viewToMakeAppoint.swift
//  Servizi
//
//  Created by khaled on 4/18/22.
//

import SwiftUI

struct viewToMakeAppoint: View {
    
    
    @State  var number1: Bool = true
    @State  var number2: Bool = true
    @State  var number3: Bool = true
    @State  var number4: Bool = true
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        
        return formatter
    }()

    @State private var isActive: Bool = false
    @State private var isActive1: Bool = false
    @State private var isActive2: Bool = false
    @State private var isActive10 : Bool = false
    @State var adrees = ""
    @State var description = ""
    @State var birthDate = Date()
  
    @State var index = 0
    @Namespace var name
    @State var value = ""
    var placeholder = " Appointment Time"
    var dropDownList = ["9-12", "1-4", "5-8"]
    @EnvironmentObject var connect : Connecter
    @StateObject var bookViewModel = BookingViewModel()
    @State var thisbirthDate = ""
    @State var time = ""
    @State var defs = UserDefaults.standard
    @State var retreivedToken = ""
    @State var beartoken = ""
    @State var biirthDate = ""
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    VStack{
                        Text ("put here")
                            .foregroundColor(.white)
                            .frame(width: gentRect().width / 4 , alignment: .leading)
                            .font(.title2)
                    }
                    .frame(width : gentRect().width / 2 )
                    
                    VStack{
                        Text("city")
                            .foregroundColor(.white)
                            .frame(width: gentRect().width / 4)
                            .font(.title)
                        
                    }
                    .frame(width : gentRect().width / 2 )
                    
                }
                .frame(width: gentRect().width)
                .background(Image("lodz")
                                .resizable()
                                .scaledToFill()
                )
                ScrollView{
                    
                    
                    VStack(spacing:10){
                        Spacer()
                        HStack {
                            
                            VStack
                            {
                                
                                Image("app image")
                                    .resizable()
                                    .scaledToFill()
                            } .frame(width: gentRect().width / 4)
                            
                            VStack{
                                Text(connect.firstName + "" + connect.lastName)
                                    .font(.headline)
                            }.frame(width: gentRect().width / 2)
                            
                            
                            
                            
                            
                        }  .frame(width: gentRect().width - 20)
                        .background(Color(UIColor(named: "scroll_view _n_1")!))
                        
                        .cornerRadius(15)
                        
                        
                        
                    } .frame(width: gentRect().width)
                    
                    Spacer()
                    Spacer()
                    VStack
                    {
                        ZStack{
                        Text(" Select Date and Time of the visit")
                            .foregroundColor(Color(UIColor(named: "bColor")!))
                            .font(.headline)
                        }
                        HStack
                        {
                            VStack{
                                Text("Select a date")
                                    .foregroundColor(.gray)
                                    .padding()
                                DatePicker(selection: $birthDate, in: Date()..., displayedComponents: .date) {
                                    Text("date")
                                    
                                }
                                 //biirthDate = Date().formatDate(name: birthDate)
                               
                                
                                Text(" You select \(biirthDate)")
                                    .hidden()
                                if number4 == false
                                {
                                    Text("please enter date")
                                        .foregroundColor(.red)
                                    
                                }
                                else
                                {
                                    Text("")
                                    Button {
                                        self.thisbirthDate = biirthDate
                                    } label: {}.hidden()

                                }
                                
                            }.labelsHidden()
                            .frame(width: gentRect().width / 2.2)
                            Rectangle()
                                .fill(Color.blue)
                                .frame(width: gentRect().width / 620,height: gentRect().height / 6.1)
                            /*********************************************************************************/
                            VStack{
                                Menu {
                                    ForEach(dropDownList, id: \.self){ client in
                                        Button(client) {
                                            self.value = client
                                        }
                                    }
                                } label: {
                                    VStack(spacing: 10){
                                        HStack{
                                            Text(value.isEmpty ? placeholder : value)
                                                .foregroundColor(value.isEmpty ? .gray : .black)
                                           Spacer()
                                            Image(systemName: "chevron.down")
                                                .foregroundColor(Color.blue)
                                                .font(Font.system(size: 20, weight: .bold))
                                        }
                                        .padding(.horizontal)
                                        Rectangle()
                                            .fill(Color.gray)
                                            .frame(height: 1)
                                            .frame(width: gentRect().width / 2 - 20)
                                        
                                    }
                                    
                                }
                                if number3 == false
                                {
                                    Text("Please Enter Time")
                                        .foregroundColor(.red)
                                    
                                }
                                else
                                {
                                    Text("")
                                    Button  {
                                        time = value
                                    } label: {}.hidden()


                                    
                                }
                            }.frame(width: gentRect().width / 2)
                            
                            
                        }.frame(width: gentRect().width )
                    }
                    .frame(width: gentRect().width - 20, height: gentRect().height / 5).background(Color(UIColor(named: "scroll_view _n_1")!))
                    .cornerRadius(15)
                    Group{
                    ZStack{
                        Text("Address")
                            .foregroundColor(.primary)
                            .font(.title3)
                    }
                        .frame(width : gentRect().width - 20, height: gentRect().height / 40, alignment: .leading)
                    TextField("",text:  $adrees)
                        
                        .frame(width : gentRect().width - 20, height: gentRect().height / 12, alignment: .top)
                        
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue))
                    if number1 == false
                    {
                        Text("please enter addres more than 3 letters ")
                            .foregroundColor(.red)
                        
                    }
                    else
                    {
                        Text("")
                        
                    }
                    
                    ZStack{
                        Text("Description")
                            .foregroundColor(.primary)
                            .font(.title3)
                    }
                        .frame(width : gentRect().width - 20, height: gentRect().height / 40, alignment: .leading)
                    TextField("",text:  $description)
                        
                        .frame(width : gentRect().width - 20, height: gentRect().height / 10, alignment: .top)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue))
                    if number2 == false
                    {
                        Text("please enter addres more than 3 letters ")
                            .foregroundColor(.red)
                        
                    }
                    else
                    {
                        Text("")
                        
                    }
                }
                    HStack{
                        VStack{
                            NavigationLink( destination: viewToMakeAppoint(),
                                            isActive: self.$isActive){
                                Text("")
                            }
                            Button("   BOOK  ")
                            {
                              if (Validate(address: adrees, description: description, time: value))
                              {
                                self.isActive = true
                                retreivedToken = defs.object(forKey: "StoredToken") as! String
                                beartoken = "Bearer-- \(retreivedToken)"
                                print(beartoken)
                                self.biirthDate = Date().formatDate(name: birthDate)
                                bookViewModel.Booking(token: beartoken, date: biirthDate, duration: value, description: description, address: adrees, technicianId: connect.technicianId)
                                print(value)
                                print(description)
                                print(adrees)
                                print(thisbirthDate)
                                print(connect.technicianId)
                              }
                             
                            }
                            .font(.title)
                         .background(Color(UIColor(named: "bColor")!))
                           .foregroundColor(.white)
                            .cornerRadius(22)
                       
                        
                            
                            
                           
                            NavigationLink( destination: SwiftUIViewAPIContoler(),
                                            isActive: self.$isActive1)
                            {
                                Text("")
                            }
                        }.frame(width: gentRect().width / 2 )
                        
                        
                        VStack{
                            Button(" CANCEL ")
                            {
                                self.isActive1 = true
                            }.font(.title)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(22)
                            
                            
                        }.frame(width: gentRect().width / 2 )
                        
                        NavigationLink( destination: login(),
                                        isActive: self.$isActive2)
                        {
                            Text("")
                        }
                    }  .frame(width: gentRect().width )
                }  .background(Color(UIColor(named: "buttons_colors")!))
        Section{
                                    NavigationLink( destination: Orderss(),
                                                    isActive: self.$isActive10)
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
               
                .navigationBarHidden(true)
            }
        }.navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    func Validate(address : String,description : String , time : String ) -> Bool
    {
        var valid = true
        //************************************************************/
        if (!stringADDValidator(name: address)) {
            number1 = false
            valid = false
        }
        else{
            number1 = true
            
            
        }
        //************************************************************/
        if (!stringValidatorfordescrip(name: description)) {
            number2 = false
            valid = false
        }
        else{
            number2 = true
            
            
        }
        //************************************************************/
        if (!stringADDValidatorfortime(name: time)) {
            number3 = false
            valid = false
        }
        else{
            number3 = true
            
            
        }
        //************************************************************/
     
        return valid
    }
    func stringADDValidator(name: String) -> Bool {
        
        if (name.count < 3 || name.isEmpty)
        {
            return false
            
        }
        else{
            
            return true
        }
    }
    func stringValidatorfordescrip(name: String) -> Bool {
        
        if (name.count < 3 || name.isEmpty)
        {
            return false
            
        }
        else{
            
            return true
        }
    }
    func stringADDValidatorfortime(name: String) -> Bool {
        
        if (name.isEmpty)
        {
            return false
            
        }
        else{
            
            return true
        }
    }
    func stringADDValidatorfordate(name: String) -> Bool {
        
        if (name.count < 3 || name.isEmpty)
        {
            return false
            
        }
        else{
            
            return true
        }
    }
    
}


struct viewToMakeAppoint_Previews: PreviewProvider {
    static var previews: some View {
        
        Group{
            viewToMakeAppoint()
                .preferredColorScheme(.dark)
            viewToMakeAppoint()
                .preferredColorScheme(.light)
        }
      
    }
}

extension Date {
    func formattDate(name:Date) -> String {
                let dateFormatter = DateFormatter()
          
            dateFormatter.dateFormat = "yyyy-MM-dd"
        
            return dateFormatter.string(from: name)
        }
}

