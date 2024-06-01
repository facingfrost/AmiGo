//
//  EndDetail.swift
//  Uni Life
//
//  Created by Francesco Palandra on 11/01/22.
//

import SwiftUI

struct EndDetail: View {

    @ObservedObject var detail: DetailModel
    var namespace: Namespace.ID
    @State var alert: Bool
    @State var current = "eye"
    
    
    @State var number: Int = 0
    @State var scale: CGFloat = 1


    
    var body: some View {
//        NavigationView{
        ZStack {
            ScrollView{
                cover
                HStack(spacing: 0){
                    TabBarButton(text: "All",current: $current, image: "eye", namespace: namespace)
                    TabBarButton(text: "My comments",current: $current, image: "person", namespace: namespace)
                }
//                Text(String(number)+" spot")
//                    .font(.headline)
//                    .foregroundColor(.secondary)
//                Divider()
                Spacer()
                spotted

                
            }
            
            .background(Color.primary.opacity(0.06))
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
            
            
            
            VStack{
                Spacer()
                HStack{
                    Spacer()
//                    Button(action:{
//                        withAnimation{
//                            alert.toggle()
//                            detail.selectedItem.alert.toggle()
//                        }
//                    }){
//                    Image(systemName: "square.and.pencil")
//                            .font(.largeTitle)
//                            .frame(width: 70,height: 70)
//                            .background(.white)
//                            .clipShape(Circle())
//                            .foregroundStyle(LinearGradient(colors: [.white,Color("Redred"),Color("Redred")], startPoint: .topLeading, endPoint: .bottomTrailing))
//                    }
                    ZStack{
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)

                        Image("redpluss")
                            .resizable()
                            .frame(width: 70, height: 70)

                    }
                    .onTapGesture {
                        alert.toggle()
                        detail.selectedItem.alert.toggle()
                    }
                        .padding()
//                        .shadow(color: Color(.gray), radius: 10,x: 0, y:9)
//                        .halfSheet(showSheet: $alert){
                            .sheet(isPresented: $alert){

                            newSpot(showSheet: $alert,show2:$detail.selectedItem.alert, event: detail.selectedItem.title)
//                        } onEnd: {
//                            print("Dismissed")
                        }

                    
            }
            }
//
//            if(alert){
//                newSpot(showSheet: $alert, event: detail.selectedItem.title)
//            }
            
        }
        
//        .navigationTitle("")
//        .navigationBarTitleDisplayMode(.inline)
//        .navigationBarHidden(true)
//        }
        
        
    }
        
    var cover: some View{
        ZStack{
            Image(detail.selectedItem.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .grayscale(1)
                .matchedGeometryEffect(id: detail.selectedItem.imageName+"end", in: namespace)
                .frame(width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height/2)
                
                
            VStack(alignment: .leading){
                HStack{
                    VStack(alignment: .leading){
                        Text(detail.selectedItem.category.uppercased())
                            .foregroundColor(.white.opacity(0.5))
                            .bold()
                            .matchedGeometryEffect(id: detail.selectedItem.id+detail.selectedItem.category+"end", in: namespace)

                            Text(detail.selectedItem.title)
                            .foregroundColor(.white)
                            .font(.title.bold())
                            .matchedGeometryEffect(id: detail.selectedItem.id + detail.selectedItem.title+"end", in: namespace)
//
                    }.padding(25)
                }.padding(.vertical)
                    .padding(.top,5)
                
                Spacer()
                HStack{
                    VStack(alignment: .leading, spacing: 5){
                        Text(detail.selectedItem.date)
                            .font(.title2.bold())
                            .foregroundColor(.white)
                            .matchedGeometryEffect(id: detail.selectedItem.id + detail.selectedItem.date+"end", in: namespace)
                        HStack(spacing: 0.3){
                        Image(systemName: "location")
                                .foregroundColor(.white.opacity(0.7))
                            
                            .matchedGeometryEffect(id: detail.selectedItem.id + "pin"+"end", in: namespace)
                            Text(detail.selectedItem.location)
                            .font(.headline.weight(.bold))
                            .foregroundColor(.white.opacity(0.7))
                            
                            .matchedGeometryEffect(id: detail.selectedItem.id + detail.selectedItem.location+"end", in: namespace)
                        
                        }
                        
                    }
                    Spacer()
                }.padding()
            }
                
                
        }
        .gesture(DragGesture(minimumDistance: 0).onChanged(onChanged(value:)).onEnded(onEnded(value:)))
    }
    
    var spotted: some View{
        VStack(spacing: 2){
            ForEach(spots){spot in
            if (spot.event == detail.selectedItem.title){
//                self.number += 1
                if (current == "eye"){
                    SpotView(spot: spot,iam: spot.iam)
                }else{
                    if spot.isMine{
                        SpotView(spot: spot,iam: spot.iam)
                    }
                }
//                Spacer()
            }
        }
        }
        
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
