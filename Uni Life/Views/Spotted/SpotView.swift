//
//  SpotView.swift
//  Uni Room
//
//  Created by Francesco Palandra on 28/12/21.
//

import SwiftUI

struct SpotView: View {
    var spot: Spot
    @State var iam: Bool
    
//    var body: some View {
//
//
//            VStack(alignment:.center,spacing: 10){
//
//                Text(spot.message)
//                    .font(.title3)
//                Spacer()
//
//                Button(action: {
//                    withAnimation{
//                        spot.iam.toggle()
//                        iam.toggle()
//                    }
//                }){
//                    if !spot.isMine{
//                    Text(iam ? "Annulla" : "Sono io!")
//                        .foregroundColor(.white)
//                        .bold()
//                        .padding(.vertical,10)
//                        .padding(.horizontal,25)
//                        .background(spot.iam ? .red : .blue)
//                        .clipShape(Capsule())
//                    }else{
//                        Text("Hai fatto tu questo Spot")
//                            .foregroundColor(.gray)
//                            .bold()
//                            .padding(.vertical,10)
//                            .padding(.horizontal,25)
//                    }
//                }
//            }.padding()
//
//            .frame(width: 340,height:170)
//        .padding(20)
//        .background(
//            Rectangle()
//                .foregroundColor(.white)
//            )
//        .mask(
//            RoundedRectangle(cornerRadius: 30,style: .continuous)
//        )
//        .shadow(color: Color(.gray), radius: 10,x: 0, y:9)
//        .padding()
//
//    }
    var body: some View {


            VStack(alignment:.center,spacing: 10){

                Text(spot.message)
                    .font(.title3)
                    .foregroundColor(.white)
                Spacer()

                Button(action: {
                    withAnimation{
                        spot.iam.toggle()
                        iam.toggle()
                    }
                }){
                    if !spot.isMine{
                    Text(iam ? "Cancel" : "It's me")
                        .foregroundColor(.white)
                        .bold()
                        .padding(.vertical,10)
                        .padding(.horizontal,25)
                        .background(spot.iam ? .red : .blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(width: 320,alignment: .trailing)
                    }else{
                        Text("You made this commercial")
                            .foregroundColor(.gray)
                            .bold()
                            .padding(.vertical,10)
                            .padding(.horizontal,25)
                    }
                }
            }.padding()

            .frame(width: 340,height:170)
        .padding(20)
        .background(
//            Rectangle()
//                .foregroundColor(.white)
            Image("Spot")
                .resizable()
                .frame(width: 400, height: 230)
            )
        .mask(
            RoundedRectangle(cornerRadius: 30,style: .continuous)
        )
        .shadow(color: Color(.gray), radius: 10,x: 0, y:9)
        .padding()

    }
}

struct SpotView_Previews: PreviewProvider {
    static var previews: some View {
        SpotView(spot: spots[1],iam: spots[1].iam)
    }
}
