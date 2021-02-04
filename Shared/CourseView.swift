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
            ScrollView {
                VStack(spacing: 20.0) {
                    
                    ForEach(courses) { item in
                        CourseItem(course: item)
                            .matchedGeometryEffect(id: item.id, in: namespaceCard, isSource: !ShowFullCard)
                            .frame(width: 335, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                   
                }
                .frame(maxWidth: .infinity)
            }
            
            if ShowFullCard {
                ScrollView {
                    CourseItem()
                        .matchedGeometryEffect(id: courses[0].id, in: namespaceCard)
                        .frame(height: 300)
                    
                    VStack {
                        ForEach(0 ..< 20) { item in
                            CourseRow()
                        }
                    }
                    .padding()
                }
                .background(Color("Background 1"))
                .transition(
                    .asymmetric(
                        insertion:    AnyTransition
                            .opacity
                            .animation(Animation.spring()
                                        .delay(0.3)),
                        
                        removal:    AnyTransition
                            .opacity
                            .animation(.spring()))
                )
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
