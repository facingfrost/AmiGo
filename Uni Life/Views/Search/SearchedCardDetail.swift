//
//  SearchedCardDetail.swift
//  Uni Life
//
//  Created by Francesco Palandra on 13/01/22.
//

import SwiftUI

struct SearchedCardDetail: View {
    
    @ObservedObject var detail: DetailModel
    var namespace: Namespace.ID
    
    
    @State private var alertIsPresented = false
    @State private var prenotato = false
    @State var number: Int = 0
    @State var buttonText1: String = "Book"
    @State var buttonText2: String = "Cancel Reservation"

    @State var scale: CGFloat = 1


    
    var body: some View {
        ZStack {
            ScrollView{
                cover
                
                details
            }
            .background(Color("Background"))
            .ignoresSafeArea()
            
            Button{
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)){
                    detail.show.toggle()

                }
            } label:{
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .padding(8)
                    .background(.ultraThinMaterial , in: Circle())
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
            .ignoresSafeArea()
            
        }
        
        
    }
        
    var cover: some View{
        ZStack{
            Image(detail.selectedItem.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: detail.selectedItem.imageName+"1", in: namespace)
                .frame(width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height/2)
                
                
            VStack(alignment: .leading){
                HStack{
                    VStack(alignment: .leading){
                        Text(detail.selectedItem.category.uppercased())
                            .foregroundColor(.white.opacity(0.5))
                            .bold()
                            .matchedGeometryEffect(id: detail.selectedItem.id+detail.selectedItem.category+"1", in: namespace)


                            Text(detail.selectedItem.title)
                            .foregroundColor(.white)
                            .font(.title.bold())
                            .matchedGeometryEffect(id: detail.selectedItem.id+detail.selectedItem.title+"1", in: namespace)

                    }.padding(25)
                    Spacer()
                    Image(systemName: detail.selectedItem.favourite ?  "bookmark.fill" : "bookmark")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .padding()
                        .matchedGeometryEffect(id: detail.selectedItem.id+"bookmark"+"1", in: namespace)
                        .onTapGesture {
                            withAnimation{
                                detail.selectedItem.favourite.toggle()
                            }
                        }

                }.padding(.vertical)
                    .padding(.top,5)
                
                Spacer()
                HStack{
                    VStack(alignment: .leading, spacing: 5){
                        HStack(alignment: .bottom){
                        Text(detail.selectedItem.date)
                            .font(.title2.bold())
                            .foregroundColor(.white)
                            .matchedGeometryEffect(id: detail.selectedItem.id+detail.selectedItem.date+"1", in: namespace)
                            Text("h: "+detail.selectedItem.hour)
                                .font(.headline)
                                .foregroundColor(.white)
                                .matchedGeometryEffect(id: detail.selectedItem.id+detail.selectedItem.hour+"1", in: namespace)
                        }

                        HStack(spacing: 0.3){
                        Image(systemName: "location")
                                .foregroundColor(.white.opacity(0.7))
                                .matchedGeometryEffect(id: detail.selectedItem.id+"pin"+"1", in: namespace)

                            Text(detail.selectedItem.location)
                            .font(.headline.weight(.bold))
                            .foregroundColor(.white.opacity(0.7))
                            .matchedGeometryEffect(id: detail.selectedItem.id+detail.selectedItem.location+"1", in: namespace)

                        
                        }
                        
                    }
                    Spacer()
                    Text(detail.selectedItem.price == 0 ? "FREE" : "€ "+String(detail.selectedItem.price))
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                        .matchedGeometryEffect(id:detail.selectedItem.id+"1", in: namespace)

                }.padding()
            }
                
                
        }
        .gesture(DragGesture(minimumDistance: 0).onChanged(onChanged(value:)).onEnded(onEnded(value:)))
    }
    
    var details: some View{
        VStack (alignment: .leading,spacing: 10){
            HStack{
                Text("Remaining Places: "+String(detail.selectedItem.capacity - self.detail.selectedItem.currentCapacity))
                Spacer()
                Button{
                    self.alertIsPresented = true
//                    decrease numbers
                }label:{
                    Text(detail.selectedItem.booked ? buttonText2 : buttonText1)
                        .font(.headline.weight(.semibold))
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            Capsule()
                        )
                       
                }
//                .accentColor(prenotato ? .red : .blue)

                .accentColor(self.detail.selectedItem.booked ? .red : .blue)
                .alert(isPresented: $alertIsPresented, content: {
                    Alert(title: Text(self.detail.selectedItem.booked ? "Cancel Reservation" : "Confirm Reservation"), message: detail.selectedItem.booked ? Text("Are you sure you want to cancel your reservation?") : Text("Are you sure you want to confirm the booking?"), primaryButton:.default(Text( "Confirm"),action:{
                          detail.selectedItem.booked.toggle()
//                          self.buttonText = detail.selectedItem.booked ? "Annulla Prenotazione" : "Prenota"
                          detail.selectedItem.currentCapacity = detail.selectedItem.booked ? detail.selectedItem.currentCapacity + 1 : detail.selectedItem.currentCapacity - 1
//                        Alert(title: Text("Conferma Prenotazione"), message: prenotato ? Text("Sei sicuro di annullare la prenotazione?") : Text("Sei sicuro di voler confernare la prenotazione?"), primaryButton:.default(Text( "Conferma"),action:{
//                            self.buttonText = !prenotato ? "Annulla Prenotazione" : "Prenota"

//                            self.number = prenotato ? self.number - 1 : self.number + 1
//                        self.prenotato.toggle()

                    
                    }), secondaryButton: .cancel(Text("Cancel")))
                })
            }
            Divider()
            Spacer()
            VStack(alignment: .leading, spacing: 5){
            HStack{
                Image(systemName: "location.fill")
                Text(detail.selectedItem.address)
            }
            HStack{
                Image(systemName: "person.2.fill")
                Text(detail.selectedItem.organization)
            }
            }
            Spacer()
            Text(detail.selectedItem.description)
        }
        .padding(20)
    }
    
    func onChanged(value: DragGesture.Value){
            let scale = value.translation.height / UIScreen.main.bounds.height
            
        if 1-scale > 0.7{
            self.scale = 1 - scale
        }
    }
                 
     func onEnded(value: DragGesture.Value){
            withAnimation(.spring()){
                if scale < 0.9{
                    detail.show.toggle()
                }
                scale = 1
            }
     }

}


