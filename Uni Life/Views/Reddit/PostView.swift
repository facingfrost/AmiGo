//
//  PostView.swift
//  Uni Room
//
//  Created by Francesco Palandra on 28/12/21.
//

import SwiftUI

struct PostView: View {
    var post: Reddit

    @State var number: Int
    
//    var body: some View {
//
//        HStack{
//
//            VStack(alignment:.leading,spacing: 10){
//                Text(post.category.uppercased())
//                    .bold()
//                    .foregroundColor(.secondary)
//                Text(post.text)
//                    .font(.title3)
//                    .frame(width:230,alignment: .leading)
//                Spacer()
//            }.padding(.top)
//            VStack (spacing: 2){
//
//                Image(systemName: "arrow.up")
//                    .font(.system(size: post.isUp ? 65 : 60).weight(.bold))
//                    .foregroundColor(.green.opacity(post.isUp ? 2.5 : 0.3))
//                    .onTapGesture {
//                        withAnimation(.interactiveSpring()){
//                            if(post.isDown){
//                                post.isDown.toggle()
//                                number+=1
//                                post.number+=1
////                                post.increment()
////                                self.post.number += 1
//                            }
//                            if(!post.isUp){
//                                post.number+=1
//                                number+=1
//                            }
//                            if(post.isUp){
//                                post.number-=1
//                                number-=1
//                            }
//                            post.isUp.toggle()
//                        }
//
//                    }
//
//                Text(String(number))
//                    .font(post.isUp || post.isDown ? .title2.bold() : .title2)
//                    .foregroundColor(.black)
//
//
//                Image(systemName: "arrow.down")
//                    .font(.system(size: post.isDown ? 65 : 60).weight(.bold))
//                    .foregroundColor(.red.opacity(post.isDown ? 1.2 : 0.3))
//                    .onTapGesture {
//                        withAnimation(.interactiveSpring()){
//                            if(post.isUp){
//                                post.isUp.toggle()
//                            post.number-=1
//                            number-=1
//                        }
//                            if(!post.isDown){
//                            post.number-=1
//                            number-=1
//                        }
//                            if(post.isDown){
//                            post.number+=1
//                            number+=1
//                        }
//                            post.isDown.toggle()
//                        }
//
//                    }
//            }
//        }
//
//        .frame(width:340,height:180)
//        .padding(10)
//        .background(
//            ZStack{
////            Rectangle()
////                .foregroundColor(Color(.white))
////                .frame(width: 350, height: 190)
////                .cornerRadius(30)
//                Image(post.category)
//                    .resizable()
//                    .cornerRadius(30)
//                    .frame(width: 350, height: 190)
//                Rectangle()
//                    .foregroundColor(Color(.white))
//                    .cornerRadius(30)
//                    .frame(width: 340, height: 180)
//            }
//
//            )
//        .mask(
//            RoundedRectangle(cornerRadius: 30,style: .continuous)
//
//        )
//
//        .padding()
//        .shadow(radius: 10,x: 0,y :9)
//
//
//
//    }
        
    var body: some View {
        ZStack{

            Image(post.category)
                .resizable()
                .frame(width: 360, height: 180)
                .cornerRadius(25)
        HStack{

            VStack(alignment:.leading,spacing: 10){
                Text(post.category.uppercased())
                    .bold()
                    .foregroundColor(.white.opacity(0.6))
                Text(post.text)
                    .font(.title3)
                    .frame(width:250,alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
            }.padding(.top)
            VStack (spacing: 2){
                ZStack{
                Image(systemName: "arrow.up.square.fill")
                        .font(.system(size: post.isUp ? 52 : 56).weight(.bold))
                        .foregroundColor(.white.opacity(0.3))
                Image(systemName: "arrow.up")
                    .font(.system(size: post.isUp ? 40 : 50).weight(.bold))
                    .foregroundColor(.white.opacity(post.isUp ? 2.5 : 0.0))
                }
                    .onTapGesture {
                        withAnimation(.interactiveSpring()){
                            if(post.isDown){
                                post.isDown.toggle()
                                number+=1
                                post.number+=1
//                                post.increment()
//                                self.post.number += 1
                            }
                            if(!post.isUp){
                                post.number+=1
                                number+=1
                            }
                            if(post.isUp){
                                post.number-=1
                                number-=1
                            }
                            post.isUp.toggle()
                        }

                    }

                Text(String(number))
                    .foregroundColor(.white)
                    .font(post.isUp || post.isDown ? .title2.bold() : .title2)
                    .foregroundColor(.black)
                ZStack{
                Image(systemName: "arrow.down.square.fill")
                        .font(.system(size: post.isDown ? 52 : 56).weight(.bold))
                        .foregroundColor(.white.opacity(0.3))
                Image(systemName: "arrow.down")
                    .font(.system(size: post.isDown ? 40 : 50).weight(.bold))
                    .foregroundColor(.white.opacity(post.isDown ? 2.5 : 0.0))
                }
                    .onTapGesture {
                        withAnimation(.interactiveSpring()){
                            if(post.isUp){
                                post.isUp.toggle()
                            post.number-=1
                            number-=1
                        }
                            if(!post.isDown){
                            post.number-=1
                            number-=1
                        }
                            if(post.isDown){
                            post.number+=1
                            number+=1
                        }
                            post.isDown.toggle()
                        }

                    }
            }
        }
        }
        .frame(width:360,height:180)
        .padding(10)
        .padding()
        .shadow(radius: 10,x: 0,y :9)



    }

}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: reddits[1],number: 100)
    }
}
