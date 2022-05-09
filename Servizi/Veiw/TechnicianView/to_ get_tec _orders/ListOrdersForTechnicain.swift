//
//  ListOrdersForTechnicain.swift
//  Servizi
//
//  Created by khaled on 4/29/22.
//

import SwiftUI

struct ListOrdersForTechnicain: View {

    @State  var choosenButton : String = "inprogress"
    @State  var nameButton : String = "inprogress"
    var body: some View {
        LoadingAPPTechnician(choosenButton: choosenButton, nameButton: nameButton)
        
        
    }
}

struct ListOrdersForTechnicain_Previews: PreviewProvider {
    static var previews: some View {
        ListOrdersForTechnicain()
    }
}
