//
//  SearchingView.swift
//  Uni Life
//
//  Created by Francesco Palandra on 13/01/22.
//

import SwiftUI

struct SearchingView: View {
    @Binding var searchText: String
    @State var editing = false
    
    var body: some View {
        VStack(alignment: .leading,spacing: 10){
            Text("Search")
                .font(.largeTitle.bold())
//                .padding()
                .frame(maxHeight:30)
//        ZStack{
//            Rectangle()
//                .foregroundColor(Color("SearchColor"))
            HStack{
                TextField("Trips, concerts and more",text: $searchText)
                    .padding(15)
                    .padding(.horizontal,25)
                    .background(Color(.systemGray6))
                    .foregroundColor(.black)
                    .cornerRadius(8)
                    .overlay(
                        HStack{
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                                .padding(.leading,15)
                
                
                        if editing {
                            Button(action: {
                                self.searchText = ""
                            }, label:{
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing,8)
                        })
                                
                    }
            })
                    .onTapGesture {
                        self.editing = true
                    }
                if editing{
                    Button(action: {
                        self.editing = false
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }){
                        Text("cancel")
                    }
                    .padding(.trailing,10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }
                    
            }
    }
    }
}

struct SearchingView_Previews: PreviewProvider {
    
    static var previews: some View {
        SearchingView(searchText: .constant(""))
    }
}
