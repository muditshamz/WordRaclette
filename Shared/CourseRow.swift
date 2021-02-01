//
//  CourseRow.swift
//  WordRaclette
//
//  Created by Mudit Sharma on 01/02/21.
//

import SwiftUI

struct CourseRow: View {
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "paperplane.circle.fill")
                .renderingMode(.template)
                .imageScale(.medium)
                .frame(width: 48, height: 48, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
            VStack(alignment: .leading, spacing: 4.0) {
                Text("SwiftUI")
                    .font(.subheadline)
                    .bold()
                Text("Description")
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
