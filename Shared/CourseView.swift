//
//  CourseView.swift
//  WordRaclette
//
//  Created by Mudit Sharma on 01/02/21.
//

import SwiftUI

struct CourseView: View {
    @State var ShowFullCard = false
    @Namespace var namespaceCard
    var body: some View{
        ZStack {
            CourseItem()
                .matchedGeometryEffect(id: "Card", in: namespaceCard, isSource: !ShowFullCard)
                .frame(width: 335, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            if ShowFullCard {
                ScrollView {
                    CourseItem()
                        .matchedGeometryEffect(id: "Card", in: namespaceCard)
                        .frame(height: 300)
                    
                    VStack {
                        ForEach(0 ..< 20) { item in
                            CourseRow()
                        }
                    }
                    .padding()
                }
                .transition(.opacity)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
        }
        .onTapGesture {
            //This solves the problem of animation delay
            withAnimation(.spring()) {
                ShowFullCard.toggle()
            }
        }
        //        .animation(.spring()) this delays the animation and back card get visible
    }
    
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
