//
//  Profile.swift
//  Uni Room
//
//  Created by Francesco Palandra on 22/12/21.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        Image("profile")
            .resizable()
            .frame(width:36, height: 36)
            .clipShape(Circle())
            .shadow(radius: 7)
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
