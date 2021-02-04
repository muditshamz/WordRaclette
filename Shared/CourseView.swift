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
    @State var selectedItem: Course? = nil
    @State var isDisabled = false
    var body: some View{
        ZStack {
            ScrollView {
                LazyVGrid(columns : Array(repeating: .init(.flexible( ),spacing : 16), count: 3),
                spacing : 16 ) {
                    ForEach(courses) { item in
                        CourseItem(course: item)
                            .matchedGeometryEffect(id: item.id, in: namespaceCard, isSource: !ShowFullCard)
                            .frame( width: 200 ,height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                            .onTapGesture {
                                //This solves the problem of animation delay
                                withAnimation(.spring()) {
                                    ShowFullCard.toggle()
                                    selectedItem = item
                                    isDisabled = true
                                }
                            }
                            .disabled(isDisabled)
                    }
                    
                }
                .padding(16)
                .frame(maxWidth: .infinity)
            }
            
            if selectedItem != nil {
                ScrollView {
                    CourseItem(course: selectedItem!)
                        .matchedGeometryEffect(id: selectedItem!.id, in: namespaceCard)
                        .frame(height: 300)
                        .onTapGesture {
                            //This solves the problem of animation delay
                            withAnimation(.spring()) {
                                ShowFullCard.toggle()
                                selectedItem = nil
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    isDisabled = false
                                }
                                
                            }
                        }
                    
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
        //        .animation(.spring()) this delays the animation and back card get visible
    }
    
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
