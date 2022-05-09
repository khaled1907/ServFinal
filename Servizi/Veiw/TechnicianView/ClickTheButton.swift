//
//  ClickTheButton.swift
//  Servizi
//
//  Created by Tala Sadeq on 4/29/22.
//

import SwiftUI

struct ClickTheButton: View {
    
    @StateObject var Post = PostReview()
    let token = "Bearer-- eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjksImlhdCI6MTY1MTcxNDEyNiwiZXhwIjoxNjUxODAwNTI2fQ.mbmGxGNv3_n8vzErG00xHFC8FW7Oyfh3XaYQB6KMeQ8"
    var body: some View {
        Button {
        Post.PostReview(content: "It's so bad that i want to give you a zero but i can't so i'll give you 1 ", rate: 2, appointmentId: 62 , token: token)
        } label: {
           Text("Button")
        }

    }
}

struct ClickTheButton_Previews: PreviewProvider {
    static var previews: some View {
        ClickTheButton()
    }
}
