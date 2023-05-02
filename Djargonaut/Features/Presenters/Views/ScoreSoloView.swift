//
//  ScoreSoloView.swift
//  Djargonaut
//
//  Created by Belinda Angelica on 30/04/23.
//

import SwiftUI

struct ScoreSoloView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .frame(width: .infinity, height: .infinity)
                    .ignoresSafeArea()
                
                VStack {
                    Text("Solo Mode")
                        .foregroundColor(Color("Title"))
                        .fontWeight(.bold)
                        .kerning(1)
                    Divider()
                        .frame(width: 120)
                        .background(Color("Title"))
                    Text("Technology")
                        .foregroundColor(Color("Title"))
                        .fontWeight(.bold)
                        .kerning(1)
                    Image("Score_Solo")
                        .resizable()
                        .scaledToFit()
                        .ignoresSafeArea()
                        .aspectRatio(contentMode: .fit)
                        .offset(x: -25, y: UIScreen.main.bounds.height / 2.4 - 50)
                    
                    Spacer()
                        .frame(height: geo.size.height * 0.6)
                }
                
                VStack {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("Title"))
                        Text("Score")
                            .foregroundColor(Color("Title"))
                            .fontWeight(.bold)
                            .font(.system(size: 30))
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("Title"))
                    }
                    Text("8000")
                        .foregroundColor(Color("Title"))
                        .fontWeight(.bold)
                        .font(.system(size: 50))
                    Text("Nice Try!")
                        .foregroundColor(Color("Title"))
                        .padding(.top, 20)
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                    Spacer()
                        .frame(height: geo.size.height * 0.5)

                }
                
                VStack {
                    Spacer()
                        .frame(height: geo.size.height * 0.8)

                    Button {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill()
                                .foregroundColor(AppColor.secondary)
                                .shadow(color: .black, radius: 4)
                                .overlay(content: {
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(.white, lineWidth: 3)
                                })
                            
                            Text("Exit to Main Menu")
                                .foregroundColor(Color("Title"))
                                .fontWeight(.bold)
                        }
                    }
                .frame(width: geo.size.width * 0.7, height: geo.size.height * 0.07)
                }
                .padding(.bottom)
            }
        }
    }
}

struct ScoreSoloView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreSoloView()
    }
}
