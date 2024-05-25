//
//  TabBar.swift
//  Uni Room
//
//  Created by Francesco Palandra on 08/01/22.
//

import SwiftUI

struct TabBar: View {
    @Namespace var namespace
    @StateObject var detailObject = DetailModel()
    @StateObject var otherDetail = DetailModel()
    @StateObject var searchDetail = DetailModel()

    
    var body: some View {
        ZStack{
            TabView{
                EventsTab(namespace: namespace)
                    .environmentObject(detailObject)
                    .tabItem{
                        Image(systemName: "house")
                        Text("Event")
                    }

                SearchTab(namespace: namespace)
                    .environmentObject(searchDetail)
                    .tabItem{
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }

                SpottedTab(namespace: namespace)
                    .environmentObject(otherDetail)
                    .tabItem{
                        Image(systemName: "binoculars")
                        Text("History")
                    }
                RedditTab()
                    .tabItem {
                        Image(systemName: "lightbulb")
                        Text("Post")
                    }
                FavouritesTab()
                    .tabItem{
                        Image(systemName: "tag")
                        Text("Reservations")
                    }
            }
            .accentColor(Color("Redred"))
            .opacity(detailObject.show || otherDetail.show || searchDetail.show ? 0 : 1)
        
            if detailObject.show {
                DetailView(detail: detailObject, namespace: namespace,favourite: detailObject.selectedItem.favourite)
                    .statusBar(hidden: detailObject.show)
        
            }
            if otherDetail.show {
                EndDetail(detail: otherDetail, namespace: namespace, alert: otherDetail.selectedItem.alert)
                    .statusBar(hidden: otherDetail.show)

            }
            if searchDetail.show {
                SearchedCardDetail(detail: searchDetail, namespace: namespace)
                    .statusBar(hidden: searchDetail.show)

            }
        }
        
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
