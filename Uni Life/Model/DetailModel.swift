//
//  DetailModel.swift
//  Uni Room
//
//  Created by Francesco Palandra on 08/01/22.
//

import SwiftUI

class DetailModel: ObservableObject {
    @Published var selectedItem = Eventi(title: "", category: "", description: "", price: 0, date: "", hour: "", location: "", organization: "", address: "", capacity: 0, imageName: "")
    
    @Published var show = false
}


