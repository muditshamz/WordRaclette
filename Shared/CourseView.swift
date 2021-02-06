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
            ScrollView() {
                LazyVGrid(
                    columns : [GridItem(.adaptive(minimum: 160),spacing: 16) ],
                spacing : 16 ) {
                    ForEach(courses) { item in
                        VStack {
                            CourseItem(course: item)
                                .matchedGeometryEffect(id: item.id, in: namespaceCard, isSource: !ShowFullCard)
                                .frame(  height: 200  , alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                
                                .onTapGesture {
                                    //This solves the problem of animation delay
                                    withAnimation(.spring(response: 0.5 , dampingFraction: 0.7, blendDuration: 0)) {
                                        ShowFullCard.toggle()
                                        selectedItem = item
                                        isDisabled = true
                                    }
                                }
                                .disabled(isDisabled)
                        }
                        .matchedGeometryEffect(id: "container\(item.id)", in: namespaceCard, isSource: !ShowFullCard)
                    }
                    
                }
                .padding(16)
                .frame(maxWidth: .infinity)
            }
            .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            
//       Full Screen
            if selectedItem != nil {
                ZStack (alignment: .topTrailing){
                    
                    CoursesDetails(course: selectedItem! , namespaceCard: namespaceCard)
                    
                    
                    CloseButton()
                        .padding(.trailing,16)
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
                }
                .zIndex(2)
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
