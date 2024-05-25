//
//  TabBarButton.swift
//  Uni Life
//
//  Created by Francesco Palandra on 14/01/22.
//

import SwiftUI

struct TabBarButton: View {
    var text: String
    @Binding var current: String
    var image: String
    var namespace: Namespace.ID

    
    var body: some View {
            
        Button(action: {
            withAnimation{
                current = image
            }
        }){
            
            VStack(spacing: 0){
                VStack(spacing: 0){
                Image(systemName: image)
                    .font(.title3)
                    .foregroundColor(current == image ? Color("Redred") : Color(.black).opacity(0.3))
                    .frame(height: 28)
                 
                Text(text)
                    .font(.footnote)
                    .foregroundColor(current == image ? Color("Redred") : Color(.black).opacity(0.3))
                }
                ZStack{
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 4)
                    
                    if current == image {
                        
                        Rectangle()
                            .fill(Color("Redred"))
                            .frame(height: 4)
                            .matchedGeometryEffect(id: "Tab", in: namespace)
                    }
                }
            }
            .frame(height: 35)
        }
    
    }
}

struct TabBarButton_Previews: PreviewProvider {
    @Namespace static var namespace

    static var previews: some View {
        TabBarButton(text: "All",current: .constant("person"), image: "person",namespace: namespace)
    }
}
