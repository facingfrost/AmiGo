//
//  EventsTab.swift
//  Uni Room
//
//  Created by Francesco Palandra on 22/12/21.
//

import SwiftUI

struct EventsTab: View {
    var namespace: Namespace.ID
    
    @EnvironmentObject var detail : DetailModel
    @State var isHide = false
    
    var body: some View {
        
        VStack{
            NavigationBar(title: "Events", hasScrolled: $isHide)
            ScrollView{
                VStack{
                    GeometryReader{reader -> AnyView in
                        let yAxis = reader.frame(in: .global).minY
                        
                        if yAxis < 0 && !isHide{
                            DispatchQueue.main.async {
                                withAnimation{isHide = true}
                            }
                        }
                        
                        if yAxis > 0 && isHide{
                            DispatchQueue.main.async {
                                withAnimation{isHide = false}
                            }
                        }
                        
                        return AnyView(
                            Text("")
                                .frame(width: 0, height: 0)
                        )
                    }
                    .frame(width: 0, height: 0)
                    
                    
                    
                    
                    ForEach(eventis){event in
                        CardView(event: event, favourite: event.favourite, namespace: namespace)
                            .onTapGesture {
                                withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)){
                                    detail.selectedItem = event
                                    detail.show.toggle()
                                }
                            }
                    }
                    
                }
                //            .padding(.top,30)
                .padding(.bottom,100)
                
            }
            
            
        }
        .ignoresSafeArea()
        .background(Color.primary.opacity(0.06).ignoresSafeArea())
        .refreshable {
            do {
                eventis = new_eventis
            }
            
        }
        
        
    }
    
    
    struct EventsTab_Previews: PreviewProvider {
        @Namespace static var namespace
        
        static var previews: some View {
            EventsTab(namespace: namespace)
            
            
        }
    }
    
}
