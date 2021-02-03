//
//  CourseList.swift
//  WordRaclette
//
//  Created by Mudit Sharma on 03/02/21.
//

import SwiftUI

struct CourseList: View {
    @ViewBuilder
    var body: some View {
        
        #if os(iOS)
        CourseViewContent
            .listStyle(InsetGroupedListStyle())
        
        #else
        CourseViewContent
            .frame(minWidth: 800, minHeight: 600)
        #endif
    }
    
    var CourseViewContent : some View{
        List(0 ..< 20) { item in
            CourseRow()
        }
       
        .navigationTitle("Courses")
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}
