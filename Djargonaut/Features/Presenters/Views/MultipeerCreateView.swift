//
//  MultipeerCreateView.swift
//  Djargonaut
//
//  Created by Jevon Levin on 21/04/23.
//

import SwiftUI

struct MultipeerCreateView: View {
    @ObservedObject var multipeerViewModel: MultipeerViewModel
    @State var chosenCategory: String = "Tech"
    @State var duration: Int = 15
    @State var cardCount: Int = 10
    var body: some View {
        VStack(spacing: 20){
            HStack{
                Text("Category")
                    .foregroundColor(AppColor.title)
                    .bold()
                
                Spacer()
                
                
                Menu {
                    Button {
                        chosenCategory = "Tech"
                    } label: {
                        Text("Tech")
                    }
                    Button {
                        chosenCategory = "Design"
                    } label: {
                        Text("Design")
                    }
                } label: {
                    Text(chosenCategory)
                    Image(systemName: "chevron.down")
                }
            }
            
            HStack{
                Text("Duration")
                    .foregroundColor(AppColor.title)
                    .bold()
                
                Spacer()
                
                Stepper(duration == 0 ? "Off" : "\(duration) s", value: $duration, in: 0...60, step: 5)
                    .frame(width: 150)
            }
            
            HStack{
                Text("Cards")
                    .foregroundColor(AppColor.title)
                    .bold()
                
                Spacer()
                
                Stepper("\(cardCount)", value: $cardCount, in: 5...30, step: 5)
                    .frame(width: 150)
            }
            
            Spacer()
            
            // TODO: fix destination (change empty view)
            ButtonLinkView(text: "Start The Journey", isPrimary: false, destination: MultipeerConnectView(multipeerSession: MultipeerSession(nickname: multipeerViewModel.nickname), isRoomCreator: true))
        }
        .padding()
        .navigationTitle("New Game")
    }
}

//struct MultipeerCreateView_Previews: PreviewProvider {
//    static var previews: some View {
//        MultipeerCreateView()
//    }
//}