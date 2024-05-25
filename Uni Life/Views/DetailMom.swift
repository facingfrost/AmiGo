//
//  DetailMom.swift
//  Uni Life
//
//  Created by Francesco Palandra on 10/01/22.
//

import SwiftUI

struct DetailMom: View {
    @ObservedObject var detail: DetailModel
    var namespace : Namespace.ID
    
    var body: some View {
        ScrollView{
            card
            
        }
        .ignoresSafeArea()
        
    }
    
    var card: some View{
        ZStack{
            Image(detail.selectedItem.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "image", in: namespace)
                .frame(width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height/2)
                
                
            VStack(alignment: .leading){
                HStack{
                    VStack(alignment: .leading){
                        Text(detail.selectedItem.category.uppercased())
                            .foregroundColor(.white.opacity(0.5))
                            .bold()
                            .matchedGeometryEffect(id: "category", in: namespace)

                            Text(detail.selectedItem.title)
                            .foregroundColor(.white)
                            .font(.title.bold())
                            .matchedGeometryEffect(id: "title", in: namespace)
//
                    }.padding(25)
                    Spacer()
                    Image(systemName: detail.selectedItem.booked ?  "bookmark.fill" : "bookmark")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .matchedGeometryEffect(id: "bookmark", in: namespace)
                        .padding()
                }.padding(.vertical)
                    .padding(.top,5)
                
                Spacer()
                HStack{
                    VStack(alignment: .leading, spacing: 5){
                        Text(detail.selectedItem.date)
                            .font(.title2.bold())
                            .foregroundColor(.white)
                            .matchedGeometryEffect(id: "date", in: namespace)
                        HStack(spacing: 0.3){
                        Image(systemName: "location")
                                .foregroundColor(.white.opacity(0.7))
                            Text(detail.selectedItem.location)
                            .font(.headline.weight(.bold))
                            .foregroundColor(.white.opacity(0.7))
                            .matchedGeometryEffect(id: "location", in: namespace)
                        
                        }
                        
                    }
                    Spacer()
                    Text(detail.selectedItem.price == 0 ? "FREE" : "€ "+String(detail.selectedItem.price))
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                        .matchedGeometryEffect(id: "price", in: namespace)
                }.padding()
            }
                
                
        }
    }
}
