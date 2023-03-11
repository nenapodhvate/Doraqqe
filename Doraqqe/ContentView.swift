//
//  ContentView.swift
//  Doraqqe
//
//  Created by Akari on 07.03.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    @State var index = 0
    @State var show = false
    
    var body: some View{
        //MARK: - Menu
        
        ZStack{
            HStack{
                VStack(alignment: .leading, spacing: 12) {
                    
                    Image("ava")
                    Text(R.Menu.titleFirst).font(Font.custom(R.Font.fontName, size: CGFloat(R.Font.fontSizeHeader)))
                        .foregroundColor(R.Colors.backgroundWhite)
                        .padding(.top, 10)
                    
                    Text(R.Menu.titleSecond).font(Font.custom(R.Font.fontName, size: CGFloat(R.Font.fontSizeHeader)))
                        .foregroundColor(R.Colors.backgroundWhite)
                    
                    Button(action: {
                        self.index = 0
                        withAnimation{
                            self.show.toggle()
                        }
                        
                    }) {
                        HStack(spacing: 25){
                            
                            Image("about")
                                .foregroundColor(self.index == 0 ? R.Colors.backgroundPink : Color.white)
                            
                            Text(R.Menu.about).font(Font.custom(R.Font.fontName, size: CGFloat(R.Font.fontSize)))
                                .foregroundColor(self.index == 0 ? R.Colors.backgroundPink : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 0 ? R.Colors.backgroundPink.opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    .padding(.top,25)
                    
                    Button(action: {
                        self.index = 1
                        withAnimation{
                            self.show.toggle()
                        }
                    }) {
                        HStack(spacing: 25){
                            
                            Image("step_1")
                                .foregroundColor(self.index == 1 ? R.Colors.backgroundPink : Color.white)
                            
                            Text(R.Menu.stepOne).font(Font.custom(R.Font.fontName, size: CGFloat(R.Font.fontSize)))
                                .foregroundColor(self.index == 1 ? R.Colors.backgroundPink : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 1 ? R.Colors.backgroundPink.opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    Button(action: {
                        self.index = 2
                        withAnimation{
                            self.show.toggle()
                        }
                    }) {
            
                        HStack(spacing: 25){
                            
                            Image("step_2")
                                .foregroundColor(self.index == 2 ? R.Colors.backgroundPink : Color.white)
                            
                            Text(R.Menu.stepTwo).font(Font.custom(R.Font.fontName, size: CGFloat(R.Font.fontSize)))
                                .foregroundColor(self.index == 2 ? R.Colors.backgroundPink : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 2 ? R.Colors.backgroundPink.opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    Button(action: {
                        self.index = 3
                        withAnimation{
                            self.show.toggle()
                        }
                        
                    }) {
                        
                        HStack(spacing: 25){
                            
                            Image("step_3")
                                .foregroundColor(self.index == 3 ? R.Colors.backgroundPink : Color.white)
                            
                            Text(R.Menu.stepThree).font(Font.custom(R.Font.fontName, size: CGFloat(R.Font.fontSize)))
                                .foregroundColor(self.index == 3 ? R.Colors.backgroundPink : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 3 ? R.Colors.backgroundPink.opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    Divider()
                        .frame(width: 150, height: 1)
                        .background(Color.white)
                        .padding(.vertical,30)
                    
                    Button(action: {
                    }) {
                        HStack(spacing: 25){
                            Text(R.Menu.xolokillua).font(Font.custom(R.Font.fontName, size: CGFloat(R.Font.fontSize)))
                                .foregroundColor(R.Colors.backgroundWhite)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                    }
                    
                    Spacer(minLength: 0)
                }
                .padding(.top,25)
                .padding(.horizontal,20)
                
                Spacer(minLength: 0)
            }
            .padding(.vertical, UIApplication
                .shared
                .connectedScenes
                .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                .first { $0.isKeyWindow }?.safeAreaInsets.top)
            .padding(.vertical, UIApplication
                .shared
                .connectedScenes
                .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                .first { $0.isKeyWindow }?.safeAreaInsets.bottom)
            
            //MARK: - MainView
            
            VStack(spacing: 0){
                HStack(spacing: 15){
                    Button(action: {
                        withAnimation{
                            self.show.toggle()
                        }
                    }) {
                        
                        Image(self.show ? "x" : "lines")
                            .resizable()
                            .frame(width: self.show ? 18 : 22, height: 18)
                            .foregroundColor(Color.black.opacity(0.4))
                    }
                    
                    Text(self.index == 0 ? R.Menu.about : (self.index == 1 ? R.Menu.stepOne : (self.index == 2 ? R.Menu.stepTwo : R.Menu.stepThree))).font(Font.custom(R.Font.fontName, size: CGFloat(R.Font.fontSize)))
                        .foregroundColor(R.Colors.backgroundBlack.opacity(0.6))
                    
                    Spacer(minLength: 0)
                }
                .padding(.top, UIApplication
                    .shared
                    .connectedScenes
                    .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                    .first { $0.isKeyWindow }?.safeAreaInsets.top)
                .padding()
                
                GeometryReader{_ in
                    VStack{
                        if self.index == 0{
                            AboutPage()
                        }
                        else if self.index == 1{
                            StepOne()
                        }
                        else if self.index == 2{
                            StepTwo()
                        }
                        else{
                            StepThree()
                        }
                    }
                }
            }
            
            .background(R.Colors.backgroundWhite)
            .cornerRadius(self.show ? 30 : 0)
            .scaleEffect(self.show ? 0.9 : 1)
            .offset(x: self.show ? UIScreen.main.bounds.width / 2 : 0, y: self.show ? 15 : 0)
            .rotationEffect(.init(degrees: self.show ? -5 : 0))
            
        }
        .background(R.Colors.backgroundBlack.edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
    }
}


struct AboutPage: View {
    var body: some View{
        VStack{
            ZStack(alignment: .bottomTrailing) {
                VStack(spacing: 12){
                    
                    Image("top")
                        .resizable()
                        .frame(height: 210)
                    
                    Text(R.About.title).font(Font.custom(R.Font.fontName, size: CGFloat(R.Font.fontSize)))
                        .foregroundColor(R.Colors.backgroundBlack)
                        .padding(.top, 10)
                    
                }
                .padding()
                .background(R.Colors.backgroundBlack.opacity(0.06))
                .cornerRadius(15)
                .padding()
                Button(action: {
                    
                }) {
                    
                    Image("blank")
                        .foregroundColor(R.Colors.backgroundWhite)
                        .padding()
                        .background(R.Colors.backgroundPink)
                        .cornerRadius(20)
                }
                .padding(.trailing)
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15){
                    HStack(spacing: 15){
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text(R.About.h1).font(Font.custom(R.Font.fontName, size: CGFloat(R.Font.fontSize)))
                                .foregroundColor(R.Colors.backgroundBlack)
                            
                            Text(R.About.description).font(Font.custom(R.Font.fontName, size: CGFloat(R.Font.fontSize)))
                                .foregroundColor(R.Colors.backgroundGray)
                        }
                        
                        Spacer(minLength: 0)
                    }
                }
                .padding()
            }
        }
    }
}

//MARK: - Views

struct StepOne: View {
    var body: some View{
        ZStack(alignment: .bottomTrailing) {
            VStack(spacing: 12){
                
                Image("hero")
                    .resizable()
                    .frame(height: 210)
                
                Text(R.StepOne.title).font(Font.custom(R.Font.fontName, size: CGFloat(R.Font.fontSize)))
                    .foregroundColor(R.Colors.backgroundBlack)
                    .padding(.top, 10)
                
            }
            .padding()
            .background(R.Colors.backgroundBlack.opacity(0.06))
            .cornerRadius(15)
            .padding()
            Button(action: {
                
                
            }) {
                Image("blank")
                    .padding()
                    .cornerRadius(20)
            }
            .padding(.trailing)
            
        }
    }
}

struct StepTwo: View {
    var body: some View{
        VStack{
            ScrollView(.vertical, showsIndicators: false) {
                Image("cal_1")
                    .resizable()
                    .frame(height: 180)
                Image("cal_2")
                    .resizable()
                    .frame(height: 180)
                Image("cal_3")
                    .resizable()
                    .frame(height: 180)
                
                Text(R.StepTwo.title).font(Font.custom(R.Font.fontName, size: CGFloat(R.Font.fontSize)))
                    .foregroundColor(R.Colors.backgroundGray)
            }
            .padding()
            .background(R.Colors.backgroundBlack.opacity(0.06))
            .cornerRadius(15)
            .padding()
        }
    }
}

struct StepThree: View {
    var body: some View{
        VStack{
            Text(R.StepThree.title).font(Font.custom(R.Font.fontName, size: CGFloat(R.Font.fontSize)))
                .foregroundColor(R.Colors.backgroundGray)
            
            Image("final")
                .resizable()
                .frame(height: 180)
        }
        .padding()
        .background(R.Colors.backgroundBlack.opacity(0.06))
        .cornerRadius(15)
        .padding()
    }
}
