//
//  ContentView.swift
//  TVsmartT
//
//  Created by bnkwsr2 on 03.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State var screen = "SplashScreen"
    @State var animation1 = false
    @State var animation2 = false
    @State var text = ""
    var body: some View {
        VStack {
            
            
            ForEach((0...5), id: \.self) { x in
                Text("red: \(Double.random(in: 0.0...255.0)), \(Double.random(in: 0.0...255.0)), \(Double.random(in: 0.0...255.0)),")
                    .foregroundColor(Color(uiColor: UIColor(red: CGFloat.random(in: 0...1), green: CGFloat(Float.random(in: 0...1)), blue: CGFloat(Float.random(in: 0...1)), alpha: 1)))
            }
            
            Text("WSR Food")
                .font(.system(size: 120))
                .frame(width: UIScreen.main.bounds.width / 2.5, height: 100)
                .opacity(animation1 || animation2 ? 1 : 0)
                .position(x: 350, y: 150)
            
            HStack {
                Image("cooking1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 500, height: 500)
                    .padding(.bottom, 50)
                    .opacity(animation1 ? 1 : 0)
                
                VStack(spacing: animation1 ? -40 : 0) {
                    Image("cooking0")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 500, height: 500)
                        .padding(.leading, animation2 ? 0 : 100)
                        .offset(x: animation2 ? UIScreen.main.bounds.width / 3 : 0, y: animation2 ? 150 : 0)
                    Image("fire0")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 500, height: 255)
                        .padding(.bottom, 100)
                        .opacity(animation2 ? 0 : 1)
                }
                .padding(.bottom, 50)
                .frame(width: 500, height: 500)
                
                Image("cooking3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 500, height: 500)
                    .padding(.bottom, 100)
                    .opacity(animation1 ? 1 : 0)
            }
            
            if (animation2) {
                HStack {
                    VStack {
                        TextField("", text: $text, prompt: Text("Text"))
                            .frame(width: 500, height: 50)
                        
                        TextField("", text: $text, prompt: Text("Text"))
                            .frame(width: 500, height: 50)
                        
                        TextField("", text: $text, prompt: Text("Text"))
                            .frame(width: 500, height: 50)
                    }
                }
                .offset(x: animation2 ? -UIScreen.main.bounds.width / 3 : 0, y : animation2 ? -500 : 0)
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Image("background-image"))
        .onAppear {
            print(Double.random(in: 0.0...255.0))
            print(Double.random(in: 0.0...255.0))
            print(Double.random(in: 0.0...255.0))
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                withAnimation(.spring()) {
                    animation1 = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        withAnimation(.spring()) {
                            animation1 = false
                            animation2 = true
                        }
                    }
                }
            }
        }
    }
}
