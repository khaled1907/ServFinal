//
//  ReatingVeiw.swift
//  Servizi
//
//  Created by khaled on 5/3/22.
//

import SwiftUI

struct ReatingVeiw: View {
    @Binding var rating : Int?
    private func starType(index : Int ) -> String{
        if let rating = self.rating{
            return index <= rating ? "star.fill" : "star"
        }
        else {
            return "star"
        }
    }
    var body: some View {
        HStack
        {
            ForEach( 1...5 , id: \.self){ index in
                Image(systemName: self.starType(index: index))
                    .resizable()
                    
                    .foregroundColor(.blue)
                    .frame(width: gentRect().width / 10 , height: gentRect().height / 30)
                    .onTapGesture {
                        self.rating = index
                    }
                
            }
        }
    }
}

struct ReatingVeiw_Previews: PreviewProvider {
    static var previews: some View {
        ReatingVeiw(rating: .constant(2))
    }
}
