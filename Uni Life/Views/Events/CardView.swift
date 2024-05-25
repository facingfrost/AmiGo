//
//  CardView.swift
//  Uni Room
//
//  Created by Francesco Palandra on 27/12/21.
//

import SwiftUI


struct CardView: View {
    var event: Eventi
    @State var favourite: Bool
    var namespace : Namespace.ID
    @Environment(\.colorScheme) var color
    
    var body: some View {
        
        ZStack{
            Image(event.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: event.imageName, in: namespace)
                .frame(width: UIScreen.main.bounds.width-30,height:400)



            
            VStack(alignment: .leading){
                
                HStack{
                    VStack(alignment: .leading){
                        Text(event.category.uppercased())
                            .foregroundColor(.white.opacity(0.5))
                            .bold()
                            .matchedGeometryEffect(id: event.id+event.category, in: namespace)
                        Text(event.title)
                            .foregroundColor(.white)
                            .font(.title.bold())
                            .matchedGeometryEffect(id: event.id+event.title, in: namespace)
                    }.padding(25)
                    Spacer()
                    
                    Image(systemName: favourite ?  "bookmark.fill" : "bookmark")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .matchedGeometryEffect(id: event.id+"bookmark", in: namespace)
                        .padding()
                        .onTapGesture {
                            withAnimation (.spring(response: 0.6, dampingFraction: 0.8)){
                                favourite.toggle()
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
                        .matchedGeometryEffect(id: event.id+event.date, in: namespace)
                            Text("h: "+event.hour)
                                .font(.headline)
                                .foregroundColor(.white)
                                .matchedGeometryEffect(id: event.id+event.hour, in: namespace)
                        
                        }
                        HStack(spacing:0.3){
                            Image(systemName: "location")
                                .foregroundColor(.white.opacity(0.7))
                                .matchedGeometryEffect(id: event.id+"pin", in: namespace)
                            Text(event.location)
                                    .foregroundColor(.white.opacity(0.7))
                                    .font(.headline.bold())
                                    .matchedGeometryEffect(id: event.id+event.location, in: namespace)
                        }

                    }
                    Spacer()
                    
                    Text(event.price == 0 ? "FREE" : "€ "+String(event.price))
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                        .matchedGeometryEffect(id:event.id, in: namespace)

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



struct CardView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        CardView(event: eventis[0], favourite: eventis[0].favourite, namespace: namespace)
    }
}
