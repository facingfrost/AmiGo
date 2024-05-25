//
//  SearchedCard.swift
//  Uni Life
//
//  Created by Francesco Palandra on 13/01/22.
//

import SwiftUI

struct SearchedCard: View {
   
    var event: Eventi
    var namespace : Namespace.ID
    @Environment(\.colorScheme) var color
    var body: some View {
        
        ZStack{
            Image(event.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: event.imageName+"1", in: namespace)
                .frame(width: UIScreen.main.bounds.width-30,height:400)



            
            VStack(alignment: .leading){
                
                HStack{
                    VStack(alignment: .leading){
                        Text(event.category.uppercased())
                            .foregroundColor(.white.opacity(0.5))
                            .bold()
                            .matchedGeometryEffect(id: event.id+event.category+"1", in: namespace)
                        Text(event.title)
                            .foregroundColor(.white)
                            .font(.title.bold())
                            .matchedGeometryEffect(id: event.id+event.title+"1", in: namespace)
                    }.padding(25)
                    Spacer()
                    
                    Image(systemName: event.favourite ?  "bookmark.fill" : "bookmark")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .matchedGeometryEffect(id: event.id+"bookmark"+"1", in: namespace)
                        .padding()
                        .onTapGesture {
                            withAnimation{
                                event.favourite.toggle()
                            }
                        }
                }
                Spacer()
                HStack{
                    VStack(alignment: .leading,spacing:5){
                        HStack(alignment: .bottom){
                        Text(event.date)
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .matchedGeometryEffect(id: event.id+event.date+"1", in: namespace)
                            Text("h: "+event.hour)
                                .font(.headline)
                                .foregroundColor(.white)
                                .matchedGeometryEffect(id: event.id+event.hour+"1", in: namespace)
                        
                        }
                        HStack(spacing:0.3){
                            Image(systemName: "location")
                                .foregroundColor(.white.opacity(0.7))
                                .matchedGeometryEffect(id: event.id+"pin"+"1", in: namespace)
                            Text(event.location)
                                    .foregroundColor(.white.opacity(0.7))
                                    .font(.headline.bold())
                                    .matchedGeometryEffect(id: event.id+event.location+"1", in: namespace)
                        }

                    }
                    Spacer()
                    
                    Text(event.price == 0 ? "FREE" : "€ "+String(event.price))
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                        .matchedGeometryEffect(id:event.id+"1", in: namespace)

                }.padding(20)
                
            }
        }
        .background(color == .dark ? Color.black : Color.white)
        .frame(height: 400)
        .cornerRadius(25)
        .shadow(radius: 10,x: 0,y :9)
        .padding()

    }

}


