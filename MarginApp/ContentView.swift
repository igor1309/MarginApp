//
//  ContentView.swift
//  MarginApp
//
//  Created by Igor Malyarov on 14.07.2020.
//

import SwiftUI

struct ContentView: View {
    @State var ratio = Ratio(markup: 3.00)
    
    private let values1: [Double] = [20, 25, 50, 75, 100, 150].map { $0/100 }
    private let values2: [Double] = [200, 250, 300, 350, 400, 500].map { $0/100 }
    
    var body: some View {
        VStack(spacing: 16) {
            Label {
                Text("Three Ends".uppercased())
            } icon: {
                Image(systemName: "square.stack.3d.down.right.fill")
            }
            .foregroundColor(.orange)
            .padding(.bottom)
            
            VStack(spacing: 10) {
                Text("Markup: \(ratio.markup * 100, specifier: "%.1f%%")")
                Text("Margin: \(ratio.margin * 100, specifier: "%.1f%%")")
                Text("Cost: \((1 - ratio.margin) * 100, specifier: "%.1f%%")")
            }
            .font(.title)
            
            Divider().padding(.vertical)
            
            Group {
                Stepper("Markup: \(ratio.markup * 100, specifier: "%.1f%%")", value: $ratio.markup, in: 0...10, step: 0.01)
                
                Picker("Markup", selection: $ratio.markup) {
                    ForEach(values1, id: \.self) { value in
                        Text("\(value * 100, specifier: "%.f%%")").tag(value)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Picker("Markup", selection: $ratio.markup) {
                    ForEach(values2, id: \.self) { value in
                        Text("\(value * 100, specifier: "%.f%%")").tag(value)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Slider(value: $ratio.markup, in: 0...10, step: 0.01)
            }
            
            Divider().padding(.vertical)
            
            HStack {
                Text("Margin: \(ratio.margin * 100, specifier: "%.1f%%")")
                Spacer()
                Text("Cost: \((1 - ratio.margin) * 100, specifier: "%.1f%%")")
            }
            
            Slider(value: $ratio.margin, in: 0...0.9999999, step: 0.005)
                .padding(.bottom)
        }
        .padding(.horizontal)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
