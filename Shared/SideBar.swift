//
//  SideBar.swift
//  WordRaclette
//
//  Created by Mudit Sharma on 02/02/21.
//

import SwiftUI

struct SideBar: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink( destination: CourseView()) {
                    Label("Courses", systemImage: "book.closed")
                }
                Label("Tutorials", systemImage: "list.bullet.rectangle")
                Label("Livestreams", systemImage: "tv")
                Label("Certificates", systemImage: "mail")
                Label("Search", systemImage: "magnifyingglass")
            }//List
            .listStyle(SidebarListStyle())
            .navigationBarTitle("Learn")
            //This courseview is for Ipad home screen
            CourseView()
        }
    }
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        SideBar()
    }
}
