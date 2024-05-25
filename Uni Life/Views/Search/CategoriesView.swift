//
//  CategoriesView.swift
//  Uni Life
//
//  Created by Francesco Palandra on 13/01/22.
//

import SwiftUI

struct CategoriesView: View {
    var category: CategoryCard

    
    var body: some View {

        ZStack{
            Image(category.category)
                .resizable()
                .frame(width: 180, height: 130)
                .cornerRadius(20)
                .shadow(radius: 5, x: 0, y: 9)
            
//            RoundedRectangle(cornerRadius: 20)
//                    .foregroundColor(category.color.opacity(0.7))
//                    .frame(width: 180, height: 130)
//                    .shadow(radius: 5, x: 0, y: 9)
            
            Text(category.category.uppercased())
                .foregroundColor(.white)
                .font(.title2.bold())
                .frame(width: 144, height: 120, alignment: .topLeading)
            
            Image(systemName: category.image)
                .foregroundColor(.white)
                .font(.system(size: 50).bold())
                .frame(width: 190, height: 120, alignment: .bottomTrailing)
                .shadow( radius: 9, x: 0, y: 9)
           
        }
        .padding()
        .frame(maxWidth: 190, maxHeight: 120)
        
        
    }
}

struct CategoryGrid: View{
    var namespace: Namespace.ID

    var body: some View{
        LazyVGrid(columns:  Array(repeating: .init(.flexible()), count: 2),spacing: 30){
           
            ForEach(categoris){category in
                
//                NavigationView{
                NavigationLink(destination: SelectedCategory(category: category.category, namespace: namespace), label: {
                CategoriesView(category: category)
                })
            
//            }
            }
            
        }
        .padding()

    }
}



struct SelectedCategory: View{
    var category: String
    var namespace: Namespace.ID
    @EnvironmentObject var detail : DetailModel
    
    var body: some View{
//        NavigationView{
        VStack(alignment: .center){
//            Text(category)
//                .font(.largeTitle.bold())
        ScrollView{
        ForEach(eventis.filter({$0.category.lowercased().contains(category.lowercased())})){event in
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
//        .offset(y: -60)
//        }
        .navigationTitle(category)
        .navigationBarTitleDisplayMode(.inline)
//        .ignoresSafeArea()
    }
}

struct CategoriesView_Previews: PreviewProvider {
    @Namespace static var namespace

    static var previews: some View {
//        CategoriesView(category: categoris[2],)
        CategoryGrid(namespace: namespace)
//        SelectedCategory(category: "Concerti", namespace: namespace)
    }
}
