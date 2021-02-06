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
    var body: some View {
        VStack {
            ScrollView {
                CourseItem(course: course)
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
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .matchedGeometryEffect(id: "container\(course.id)", in: namespaceCard)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CoursesDetails_Previews: PreviewProvider {
    @Namespace static var namespaceCard
    static var previews: some View {
        CoursesDetails( namespaceCard: namespaceCard)
    }
}
