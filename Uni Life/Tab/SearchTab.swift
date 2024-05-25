//
//  SearchTab.swift
//  Uni Room
//
//  Created by Francesco Palandra on 22/12/21.
//

import SwiftUI

struct SearchTab: View {
    var namespace: Namespace.ID
    @State var searchText = ""
    @State var searching = false
    @State var hasScrolled  = false
    @EnvironmentObject var detail : DetailModel


    var body: some View {
        NavigationView{
        VStack(alignment: .leading){
                ScrollView{
                    
                    

                        SearchingView(searchText: $searchText)
                            .padding(.bottom)
                            .padding(.horizontal)
                            
                        Divider()
                        
                 
                        if(searchText == ""){
                            CategoryGrid(namespace: namespace)
                        }
                        else{
                            ForEach(eventis.filter({$0.title.lowercased().contains(searchText.lowercased())})){event in     
                                SearchedCard(event: event, namespace: namespace)
                                    .onTapGesture {
                                        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)){
                                            detail.selectedItem = event
                                            detail.show.toggle()
                                        }
                                    }
                                    
                            }
                         
                    }
                            
                    }

        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
//        .offset(y: -60)
        }
    }
}

struct SearchTab_Previews: PreviewProvider {
    @Namespace static var namespace

    static var previews: some View {
        SearchTab(namespace: namespace)
    }
}
