//
//  CourseRow.swift
//  WordRaclette
//
//  Created by Mudit Sharma on 01/02/21.
//

import SwiftUI

struct CourseRow: View {
    var item : CourseSection = courseSections[0]
    
    var body: some View {
        HStack(alignment: .top) {
            Image(item.logo)
                .renderingMode(.original)
                .imageScale(.medium)
                .frame(width: 48, height: 48, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(item.color)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            VStack(alignment: .leading, spacing: 4.0) {
                Text(item.title)
                    .font(.subheadline)
                    .bold()
                Text(item.subtitle)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }//Vstack
            Spacer()
        }//Hstack
    }
}

struct CourseRow_Previews: PreviewProvider {
    static var previews: some View {
        CourseRow()
    }
}
