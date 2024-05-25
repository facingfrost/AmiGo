//
//  newReddit.swift
//  Uni Life
//
//  Created by Francesco Palandra on 11/01/22.
//

import SwiftUI

struct newReddit: View {
    @Binding var showSheet: Bool
    @State var selection: String = ""
    @State var message: String = ""
    
    var body: some View{
        ZStack{
            Color(.systemGray6)
            VStack{
                NavigationView{
                    VStack{
                        Form{
                            Section (header: Text("Select the Category")){
                            Picker(selection: $selection, label: Text("Category")){
                                ForEach(categoris){ category in
                                    Text(category.category).tag(category.category)
                    }
                }
                        
                        
                    
                    }
                    Section (header: Text("Write the Proposal")){
                    TextEditor(text: $message)
                            .frame(height: 100)
                    }
                }
                    Button(action: {
                        withAnimation{
                            if(!message.isEmpty && !selection.isEmpty){
                                addProposta()
                                showSheet.toggle()
                            }
                        }
                    }){
                        Text("Send the Proposal")
                            .foregroundColor(.white)
                            .bold()
                            .padding(.vertical,20)
                            .padding(.horizontal,25)
                            .background(message.isEmpty || selection.isEmpty ? .gray : .blue)
                            .clipShape(Capsule())
                    }
                    .padding(.bottom,350)
                }
//                .ignoresSafeArea()
                .background(Color(.systemGray6))
                .navigationBarTitle(Text("New Proposal"))
                }
//                .ignoresSafeArea()
                }
//                .ignoresSafeArea()
//                .offset(y:-40)
               
                
            
            
            VStack{
                HStack{
                    Spacer()
            Button{
                showSheet.toggle()
            } label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .padding(8)
                    .background(.ultraThinMaterial , in: Circle())
            }
            .padding(20)
                }
                
                Spacer()
            }
            
            
          
            
            
                
        }
//        .ignoresSafeArea()
    }
    
    func addProposta(){
            reddits.append(Reddit(category: selection, text: message, isMine: true))
    }
}

struct newSpot: View {
    @Binding var showSheet: Bool
    @Binding var show2: Bool
    var event: String
    @State var message: String = ""


    
    
    var body: some View{
        ZStack{
            Color(.systemGray6)
            VStack{
                NavigationView{
                    VStack{
                        Form{
                    Section (header: Text("Write the Spot here")){
                    TextEditor(text: $message)
                            .frame(height: 150)
                    }
                }
                    Button(action: {
                        withAnimation{
                            if(!message.isEmpty){
                                addSpot()
                                showSheet.toggle()
                                show2.toggle()
                                
                                
                            }
                        }
                    }){
                        Text("Publish Spot")
                            .foregroundColor(.white)
                            .bold()
                            .padding(.vertical,20)
                            .padding(.horizontal,25)
                            .background(message.isEmpty ? .gray : .blue)
                            .clipShape(Capsule())
                    }
                    .padding(.bottom,400)
                }
//                .ignoresSafeArea()
                .background(Color(.systemGray6))
                .navigationBarTitle(Text("New Spot"))
                }
//                .ignoresSafeArea()
                }
//                .ignoresSafeArea()
//                .offset(y:-40)
               
                
            
            
            VStack{
                HStack{
                    Spacer()
            Button{
                show2.toggle()
                showSheet.toggle()
            } label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .padding(8)
                    .background(.ultraThinMaterial , in: Circle())
            }
                }
                .padding()
                Spacer()
            }
            
            
          
            
            
                
        }
//        .ignoresSafeArea()
    }

    
    func addSpot(){
//        if(!message.isEmpty){
//        spots.insert(Spot(message: message, event: event), at: 0)
        spots.insert(Spot(message: message, event: event,isMine: true), at: 0)

//        }
    }
        
}



extension View{
    
    func halfSheet <SheetView: View> (showSheet: Binding<Bool>,@ViewBuilder sheetView: @escaping ()->SheetView,onEnd: @escaping ()->())->some View{
        return self
            .background(
                HalfSheetHelper(sheetView: sheetView(),showSheet: showSheet, onEnd: onEnd)
            )
    }
}


struct HalfSheetHelper<SheetView: View>: UIViewControllerRepresentable{
        
    var sheetView: SheetView
    @Binding var showSheet: Bool
    var onEnd: ()->()
    
    let controller = UIViewController()
    
    func makeCoordinator() -> Coordinator {
        
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        controller.view.backgroundColor = .clear
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        if showSheet{
            
            let sheetController = CustomHostingController(rootView: sheetView)
            sheetController.presentationController?.delegate = context.coordinator
            uiViewController.present(sheetController,animated: true)
            }
        else{
            uiViewController.dismiss(animated: true)
        }
    }
    
    class Coordinator: NSObject,UISheetPresentationControllerDelegate{
        
        var parent: HalfSheetHelper
        
        init(parent: HalfSheetHelper){
            self.parent = parent
        }
        
        func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
            parent.showSheet = false
            parent.onEnd()
        }
    }
}

class CustomHostingController<Content: View>: UIHostingController<Content>{
    
    override func viewDidLoad() {
        
        view.backgroundColor = .clear
        
        if let presentationController = presentationController as? UISheetPresentationController{
            
            presentationController.detents = [
            
                .medium(),
                .large()
            ]
            
            presentationController.prefersGrabberVisible = true
        }
    }
}

struct newReddit_Previews: PreviewProvider {
    static var previews: some View {
        newReddit(showSheet: .constant(false))
//        newSpot(showSheet: .constant(false), show2: .constant(false), event: "cai")
    }
}
