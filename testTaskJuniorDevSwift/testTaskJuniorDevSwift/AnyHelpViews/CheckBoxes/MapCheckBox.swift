//
//  MapCheckBox.swift
//  testTaskJuniorDevSwift
//
//  Created by Ainur on 09.02.2024.
//

import SwiftUI

struct MapCheckBox: View {
    @State var checkBox: String
    var body: some View {
        Image(checkBox)
    }
}

#Preview {
    MapCheckBox(checkBox: "Checkbox")
}
