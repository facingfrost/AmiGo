//
//  RedditTab.swift
//  Uni Room
//
//  Created by Francesco Palandra on 22/12/21.
//

import SwiftUI
 
struct RedditTab: View {
    @State var alert: Bool = false
    @State var hasScrolled: Bool = false
    @State var current = "arrow.up.arrow.down"
    @Namespace var namespace
    
    var body: some View {
        NavigationView{
        ZStack{
        VStack{
            NavigationBar(title: "Post", hasScrolled: $hasScrolled)
//                .padding(.bottom)
//            Divider()
            HStack(spacing: 0){
                TabBarButton(text: "All",current: $current, image: "arrow.up.arrow.down", namespace: namespace)
                TabBarButton(text: "My proposal",current: $current, image: "person", namespace: namespace)
            }
//            Divider()
//            if current == "arrow.up.arrow.down" {
        ScrollView{
            VStack{
                GeometryReader{reader -> AnyView in
                    let yAxis = reader.frame(in: .global).minY
                    
                    if yAxis < 0 && !hasScrolled{
                        DispatchQueue.main.async {
                            withAnimation{hasScrolled = true}
                        }
                    }
                    
                    if yAxis > 0 && hasScrolled{
                        DispatchQueue.main.async {
                            withAnimation{hasScrolled = false}
                        }
                    }
                    
                    return AnyView(
                        Text("")
                            .frame(width: 0, height: 0)
                    )
                }
                    .frame(width: 0, height: 0)
                
                ForEach(reddits.sorted{ (post1, post2) -> Bool in
                    return post1.number > post2.number } ){post in
                    if current == "arrow.up.arrow.down"{
                        PostView(post: post,number: post.number)
                    }
                    else{
                        if post.isMine {
                            PostView(post: post,number: post.number)
                        }
                    }
                }
                
               
            }
//            .padding(.top,30)
            .padding(.bottom,100)


        }
        }
        .ignoresSafeArea()
        .background(Color.primary.opacity(0.06).ignoresSafeArea())
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Image("redpluss")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .onTapGesture {
                            withAnimation{
                                alert.toggle()
                            }
                        }
//                    Button(action:{
//                        withAnimation{
//                            alert.toggle()
//                        }
//                    }){
//                    Image(systemName: "plus")
//                            .font(.largeTitle)
//                            .frame(width: 70,height: 70)
//                            .background(LinearGradient(colors: [.white], startPoint: .topLeading, endPoint: .bottomTrailing))
//                            .clipShape(Circle())
//                            .foregroundStyle(LinearGradient(colors: [.white,Color("Redred"),.black], startPoint: .topLeading, endPoint: .bottomTrailing))
//                    }
                        .padding()
//                        .shadow(color: Color(.gray), radius: 3,x: 0, y:6)
                        .sheet(isPresented: $alert){
//                        .halfSheet(showSheet: $alert){
                            newReddit(showSheet: $alert)
//                        } onEnd: {
//                            print("Dismissed")
                        }
                    }


            }
//            }
            
//            if(alert){
//                newReddit(show: $alert)
//            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
        }
            
           
        

        
    }
}





struct RedditTab_Previews: PreviewProvider {
    static var previews: some View {
        RedditTab()
    }
}
