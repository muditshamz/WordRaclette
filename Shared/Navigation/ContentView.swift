//
//  ContentView.swift
//  Shared
//
//  Created by Mudit Sharma on 31/01/21.
//

import SwiftUI

struct ContentView: View {
    @ViewBuilder
    var body: some View {
        #if os(iOS)
        SideBar()
        
        #else
        SideBar()
            .frame(minWidth: 1000,minHeight:600)
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
