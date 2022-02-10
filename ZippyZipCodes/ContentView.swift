//
//  ContentView.swift
//  ZippyZipCodes
//
//  Created by Justin Lowry on 2/9/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ZipCodeView()
            ZipCodeView()
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .background(Color.unbleachedSilk)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}

struct ZipCodeView: View {
    @State var textFieldText: String = ""
    
    var body: some View {
        ZStack {
            Color.unbleachedSilk
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Zippy Zip Codes")
                    .font(.system(size: 30, weight: .medium, design: .default))
                    .foregroundColor(.oldBurgundy)
                    .padding()
                Spacer()
                    .frame(height: 40)
                TextField("Zip Code...", text: $textFieldText)
                    .textFieldStyle(OvalTextFieldStyle())
                    .font(.system(size: 16, weight: .medium, design: .default ))
                    .foregroundColor(.oldBurgundy)
                    .padding(20)
                Text("(city) (state)")
                    .font(.system(size: 16, weight: .medium, design: .default ))
                    .foregroundColor(.oldBurgundy)
//                    .hidden()
                    .padding(.top, 40)
                Spacer()
            }
        }
    }
}

struct ZipCodeView_Previews: PreviewProvider {
    static var previews: some View {
        ZipCodeView()
    }
}
