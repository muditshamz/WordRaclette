//
//  CourseItem.swift
//  WordRaclette
//
//  Created by Mudit Sharma on 03/02/21.
//

import SwiftUI

struct CourseItem: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 4) {
            Spacer()
            HStack {
                Spacer()
                Image("Illustration 1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
            }
            Text("SwiftUI iOS 14")
                .bold()
                .foregroundColor(Color.white)
            Text("20 Sections")
                .font(.footnote)
                .foregroundColor(Color.white)
        }
        .padding()
        .background(Color.blue)
        .cornerRadius(20)
        .shadow(radius: 20 )
    }
}

struct CourseItem_Previews: PreviewProvider {
    static var previews: some View {
        CourseItem()
    }
}