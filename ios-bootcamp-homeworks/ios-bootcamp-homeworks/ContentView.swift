//
//  ContentView.swift
//  ios-bootcamp-homeworks
//
//  Created by Roman on 9/1/23.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @State var red: Float = 0.0
    @State var green: Float = 0.0
    @State var blue: Float = 0.0
    
    @State var redFromSlider = 0.0
    @State var greenFromSlider = 0.0
    @State var blueFromSlider = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Color Picker")
                    .font(.title)
                    .padding(.top)
                
                Rectangle()
                    .fill(Color(#colorLiteral(red: red, green: green, blue: blue, alpha: 1)))
                    .frame(height: geometry.size.width)
                
                VStack(){
                    Text("Red \(Int(redFromSlider))")
                    Slider(value: $redFromSlider, in: 0...255)
                    Text("Green \(Int(greenFromSlider))")
                    Slider(value: $greenFromSlider, in: 0...255)
                    Text("Blue \(Int(blueFromSlider))")
                    Slider(value: $blueFromSlider, in: 0...255)
                }
                .padding(.vertical)
                
                Button{
                    red = Float(redFromSlider / 255)
                    green = Float(greenFromSlider / 255)
                    blue = Float(blueFromSlider / 255)
                } label: {
                    Text("Set Color")
                        .bold()
                }
            }
        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(red: 0.7137255072593689, green: 0.10196077823638916, blue: 0.10196077823638916)
    }
}

