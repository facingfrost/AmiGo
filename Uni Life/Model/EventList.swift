//
//  EventList.swift
//  Uni Room
//
//  Created by Francesco Palandra on 08/01/22.
//

import SwiftUI

struct EventList: View {
    var namespace: Namespace.ID
    @State var show = false
    
    var body: some View {
        ScrollView{
            VStack{
                NavigationBar(title: "Eventi Ufficiali", hasScrolled: .constant(false))
                    .padding()
                    ForEach(events){event in
                        CardView(event: event, namespace: namespace, show: $show)
                }

            }
        }
    }
}


