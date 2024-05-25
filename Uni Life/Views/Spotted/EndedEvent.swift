//
//  EndedEvent.swift
//  Uni Life
//
//  Created by Francesco Palandra on 11/01/22.
//

import SwiftUI

struct EndedEvent: View {
    var event: Eventi
    var namespace : Namespace.ID
//    @Environment(\.colorScheme) var color
    @Environment(\.colorScheme) var color
    
    var body: some View {

        ZStack{
            Image(event.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
//                .grayscale(0.9)
                .grayscale(1)
                .matchedGeometryEffect(id: event.imageName+"end", in: namespace)
                .frame(width: UIScreen.main.bounds.width-30,height:250)


            
            
            VStack(alignment: .leading){
                
                HStack{
                    VStack(alignment: .leading){
                        Text(event.category.uppercased())
                            .foregroundColor(.white.opacity(0.5))
                            .bold()
                            .matchedGeometryEffect(id: event.id+event.category+"end", in: namespace)
                        
                            Text(event.title)
                            .foregroundColor(.white)
                            .font(.title.bold())
                            .matchedGeometryEffect(id: event.id+event.title+"end", in: namespace)
                    }.padding(25)
                
                }
                Spacer()
                HStack{
                    VStack(alignment: .leading,spacing:5){
                        Text(event.date)
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .matchedGeometryEffect(id: event.id+event.date+"end", in: namespace)
                        
                        HStack(spacing:0.3){
                            Image(systemName: "location")
                                .foregroundColor(.white.opacity(0.7))
                                .matchedGeometryEffect(id: event.id+"pin"+"end", in: namespace)
                            Text(event.location)
                                    .foregroundColor(.white.opacity(0.7))
                                    .font(.headline.bold())
                                    .matchedGeometryEffect(id: event.id+event.location+"end", in: namespace)
                        }

                    }
                    Spacer()
                }.padding(20)
                
            }
//            .matchedGeometryEffect(id: event.id, in: namespace)
        }
        .background(color == .dark ? Color.black : Color.white)
        .frame(height: 250)
        .cornerRadius(25)
        .shadow(radius: 10,x: 0,y :9)
        .padding()

    }

//
//    func spotNumber(){
//        ForEach(endEvents){endEvent in
//            if (endEvent.title == "OK"){
//                numberofSpot += 1
//            }
//        }
//    }
}


struct EndedEvent_Previews: PreviewProvider {
    @Namespace static var namespace

    static var previews: some View {
        EndedEvent(event: endEvents[0], namespace: namespace)
    }
}
