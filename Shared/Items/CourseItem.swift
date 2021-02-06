//
//  CourseItem.swift
//  WordRaclette
//
//  Created by Mudit Sharma on 03/02/21.
//

import SwiftUI

struct CourseItem: View {
    var course: Course = courses[0]
    #if os(iOS)
    var cornerRadius : CGFloat = 22
    #else
    var cornerRadius : CGFloat = 10
    #endif
    var body: some View { 
        VStack(alignment: .leading,spacing: 4) {
            Spacer()
            HStack {
                Spacer()
                Image(course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
            }
            Text(course.title)
                .bold()
                .foregroundColor(Color.white)
            Text(course.subtitle )
                .font(.footnote)
                .foregroundColor(Color.white)
        }
        .padding()
        .background(course.color )
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
        .shadow(color:course.color.opacity(0.3),radius: 20, x: 0, y: 10 )
    }
}

struct CourseItem_Previews: PreviewProvider {
    static var previews: some View {
        CourseItem()
    }
}
