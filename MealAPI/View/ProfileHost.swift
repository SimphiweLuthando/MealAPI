//
//  ProfileHost.swift
//  MealAPI
//
//  Created by Simphiwe Mbokazi on 2023/07/12.
//

import SwiftUI


struct ProfileHost: View {
    @State private var draftProfile = Profile.default


    var body: some View {
        Text(" \(draftProfile.username)")
            .font(.title)
            .fontWeight(.semibold)
    }
}


struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
