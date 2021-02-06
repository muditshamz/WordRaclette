//
//  CoursesDetails.swift
//  WordRaclette
//
//  Created by Mudit Sharma on 06/02/21.
//

import SwiftUI

struct CoursesDetails: View {
    var course : Course = courses[0]
    var namespaceCard : Namespace.ID
    #if os(iOS)
    var cornerRadius : CGFloat = 22
    #else
    var cornerRadius : CGFloat = 0
    #endif
    var body: some View {
        #if os(iOS)
        content
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        #else
        content
        #endif
    }
    var content : some View{
        VStack {
            ScrollView {
                CourseItem(course: course, cornerRadius: 0)
                    .matchedGeometryEffect(id: course.id, in: namespaceCard)
                    .frame(height: 300)
                   
                
                VStack {
                    ForEach(courseSections) { item in
                        CourseRow(item: item)
                        Divider()
                    }
                }
                .padding()
            }
        }
        .background(Color("Background 1"))
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .matchedGeometryEffect(id: "container\(course.id)", in: namespaceCard)
    }
}

struct CoursesDetails_Previews: PreviewProvider {
    @Namespace static var namespaceCard
    static var previews: some View {
        CoursesDetails( namespaceCard: namespaceCard)
    }
}
