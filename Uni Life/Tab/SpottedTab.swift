//
//  SpottedTab.swift
//  Uni Room
//
//  Created by Francesco Palandra on 22/12/21.
//

import SwiftUI

struct SpottedTab: View {
    var namespace: Namespace.ID
    @EnvironmentObject var detail : DetailModel
    @State var hasScrolled: Bool = false

    
    var body: some View {
        NavigationView{
        VStack{
            NavigationBar(title: "History", hasScrolled: $hasScrolled)
            
            Divider()
        
        ScrollView{
            VStack{
                       
                GeometryReader{reader -> AnyView in
                    let yAxis = reader.frame(in: .global).minY
                    
                    if yAxis < 0 && !hasScrolled{
                        DispatchQueue.main.async {
                            withAnimation{hasScrolled = true}
                        }
                    }
                    
                    if yAxis > 0 && hasScrolled{
                        DispatchQueue.main.async {
                            withAnimation{hasScrolled = false}
                        }
                    }
                    
                    return AnyView(
                        Text("")
                            .frame(width: 0, height: 0)
                    )
                }
                    .frame(width: 0, height: 0)
//                Divider()
                Text("Events concluded: \(endEvents.count)")
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .foregroundColor(.gray)
                    .padding()
                
                ForEach(0...endEvents.count-1,id: \.self){i in
                    EndedEvent(event: endEvents[i], namespace: namespace)
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)){
                                detail.selectedItem = endEvents[i]
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
            
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

struct SpottedTab_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        SpottedTab(namespace: namespace)
    }
}
