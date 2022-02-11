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
        }
//        .tabViewStyle(.page(indexDisplayMode: .always))
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
    // Text Field
    @State private var zipCode: String = ""
    
    @State var resultsText: String = ""
    @State var isFetching = false
    
    let zipCodeModel = ZipCodeModel()
    
    var body: some View {
        ZStack {
            Color.unbleachedSilk
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Zippy Zip Codes")
                    .font(.system(size: 28, weight: .medium, design: .default))
                    .foregroundColor(.oldBurgundy)
                    .padding()
                Spacer()
                    .frame(height: 40)
                HStack {
                    TextField("Zip Code...", text: $zipCode)
                        .limitInputLength(value: $zipCode, length: 5)
                        .textFieldStyle(OvalTextFieldStyle())
                        .multilineTextAlignment(.center)
                        .font(.system(size: 22, weight: .medium, design: .default ))
                        .foregroundColor(.oldBurgundy)
                        .textContentType(.postalCode)
                        .keyboardType(.numberPad)
                    Spacer()
                    Button {
                        isFetching = true
                        Task {
                            do {
                                try await self.zipCodeModel.fetch(zipCode: self.zipCode)
                                guard let result = zipCodeModel.result else { return }
                                resultsText = result
                            } catch {
                                print("Error", error)
                            }
                            isFetching = false
                        }
                    } label: {
                        Image(systemName: "arrow.up.circle.fill")
                            .rotationEffect(.degrees(90))
                            .foregroundColor(.buttonColor)
                            .shadow(color: .unbleachedSilkShadow,
                                    radius: 2,
                                    x: 0,
                                    y: 2)
                            .font(.system(size: 46))
                    }
                }
                .padding([.leading, .trailing], 40)
                ZStack {
                    ProgressView()
                        .padding(.top, 40)
                        .isHidden(!isFetching)
                    Text(resultsText)
                        .font(.system(size: 18, weight: .medium, design: .default ))
                        .foregroundColor(.oldBurgundy)
                        .padding(.top, 40)
                        .isHidden(isFetching)
                }
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

struct TextLimiter: ViewModifier {
    @Binding var value: String
    
    var length: Int

    func body(content: Content) -> some View {
        content
            .onReceive(value.publisher.collect()) {
                value = String($0.prefix(length))
            }
    }
}
