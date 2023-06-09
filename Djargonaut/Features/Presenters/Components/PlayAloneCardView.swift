//
//  MultipeerGuesserCardView.swift
//  Djargonaut
//
//  Created by Naufal R. Ariekananda on 04/05/23.
//

import SwiftUI

struct PlayAloneCardView: View {
    @EnvironmentObject var jargonListVM: JargonListViewModel
    
    //MARK: Variables
    let base: String
    let wrongAnswer: String
    let category: String
    let desc: String
    let cardCount: Int
    let currentCard: Int
    let randomInt: Int
    let width: CGFloat
    
    @State var backDegree = 90.0
    @State var frontDegree = 0.0
    
    @Binding var score: Int
    @Binding var i: Int
    @Binding var isCorrect: [Int]
    @Binding var isFlipped: Bool
    @Binding var timeRemaining: Int
    
    let durationAndDelay : CGFloat = 0.1
    let playAloneVM: PlayAloneViewModel
    
    //MARK: Flip Card Function
    func flipCard () {
        if !isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
        }
    }
    //MARK: View Body
    var body: some View {
        VStack{
            ZStack {
                CardFront(base: base, category: category, desc: desc, wrongAnswer: wrongAnswer, cardCount: cardCount, currentCard: currentCard, playAloneVM: playAloneVM, randomInt: randomInt, isCorrect: $isCorrect, degree: $frontDegree, score: $score, i: $i, isFlipped: $isFlipped, timeRemaining: $timeRemaining)
                CardBack(base: base, category: category, desc: desc, cardCount: cardCount, currentCard: currentCard, degree: $backDegree)
            }
            .padding(.horizontal, width)
            .padding(.bottom, 20)
        }
        .onChange(of: isFlipped){ _ in
            flipCard()
        }
    }
}

struct CardFront : View {
    @EnvironmentObject var jargonListVM: JargonListViewModel
    
    let base: String
    let category: String
    let desc: String
    let wrongAnswer: String
    let cardCount: Int
    let currentCard: Int
    let playAloneVM: PlayAloneViewModel
    let randomInt: Int
    
    @State var options = Array<String>()
    
    @Binding var isCorrect: [Int]
    @Binding var degree : Double
    @Binding var score: Int
    @Binding var i: Int
    @Binding var isFlipped: Bool
    @Binding var timeRemaining: Int
    
    var body: some View {
        ZStack {
            HStack (alignment: .top) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(category)")
                            .foregroundColor(.white)
                            .font(.system(size: 21))
                            .padding(.vertical, 3)
                            .padding(.horizontal, 30)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(.white), lineWidth: 1.5)
                            )
                        Spacer()
                        Text("\(currentCard) / \(cardCount)")
                            .foregroundColor(.white)
                            .font(.system(size: 21, weight: .bold))
                    }
                    Spacer()
                    Text("\(desc)")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                    Spacer()
                    
                    Divider()
                        .overlay(.white)
                        .padding(.vertical, 20)
                    
                    
                    if randomInt == 1 {
                        //MARK: Answer 1
                        Button {
                            print("pencet")
                            isCorrect[i] = 1
                            score += 100
                            isFlipped = true
                            timeRemaining = 0
                        } label: {
                            Text("\(base)")
                                .foregroundColor(.white)
                                .font(.system(size:16, weight: .bold))
                                .padding(15)
                                .frame(maxWidth: .infinity)
                                .background(selectBorder())
                                .cornerRadius(13)
                                .padding(.vertical, 20)
                        }
                        
                        //MARK: Answer 2
                        Button {
                            print("pencet")
                            isCorrect[i] = -1
                            isFlipped = true
                            timeRemaining = 0
                        } label: {
                            Text("\(wrongAnswer)")
                                .foregroundColor(.white)
                                .font(.system(size:16, weight: .bold))
                                .padding(15)
                                .frame(maxWidth: .infinity)
                                .background(selectBorder())
                                .cornerRadius(13)
                        }
                        Spacer()
                    } else {
                        //MARK: Answer 1
                        Button {
                            print("pencet")
                            isCorrect[i] = -1
                            isFlipped = true
                            timeRemaining = 0
                        } label: {
                            Text("\(wrongAnswer)")
                                .foregroundColor(.white)
                                .font(.system(size:16, weight: .bold))
                                .padding(15)
                                .frame(maxWidth: .infinity)
                                .background(selectBorder())
                                .cornerRadius(13)
                                .padding(.vertical, 20)
                        }
                        
                        //MARK: Answer 2
                        Button {
                            print("pencet")
                            isCorrect[i] = 1
                            score += 100
                            isFlipped = true
                            timeRemaining = 0
                        } label: {
                            Text("\(base)")
                                .foregroundColor(.white)
                                .font(.system(size:16, weight: .bold))
                                .padding(15)
                                .frame(maxWidth: .infinity)
                                .background(selectBorder())
                                .cornerRadius(13)
                        }
                        Spacer()
                    }
                }
            }
            .frame(height: 452)
            .padding(40)
            .background(
                Image("\(selectBackground())")
                    .resizable()
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(selectBorder(), lineWidth: 5)
                    )
            )
        }
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
    
    func selectBackground() -> String {
        var bg: String = ""
        if (category == "Technology") {
            bg = "Flashcards_Tech"
        } else if (category == "Design") {
            bg = "Flashcards_Design"
        } else if (category == "Accounting") {
            bg = "Flashcards_Accounting"
        } else if (category == "Game") {
            bg = "Flashcards_Game"
        }
        return bg
    }
    
    func selectBorder() -> Color {
        var border: Color = Color("Border_Tech")
        if (category == "Technology") {
            border = Color("Border_Tech")
        } else if (category == "Design") {
            border = Color("Border_Design")
        } else if (category == "Accounting") {
            border = Color("Border_Accounting")
        } else if (category == "Game") {
            border = Color("Border_Game")
        }
        return border
    }
}

struct CardBack : View {
    let base: String
    let category: String
    let desc: String
    let cardCount: Int
    let currentCard: Int
    
    @Binding var degree : Double
    
    var body: some View {
        ZStack {
            HStack (alignment: .top) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(category)")
                            .foregroundColor(.white)
                            .font(.system(size: 21))
                            .padding(.vertical, 3)
                            .padding(.horizontal, 30)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(.white), lineWidth: 1.5)
                            )
                        Spacer()
                        Text("\(currentCard) / \(cardCount)")
                            .foregroundColor(.white)
                            .font(.system(size: 21, weight: .bold))
                    }
                    Spacer()
                    Text("\(base)")
                        .font(.system(size: 41, weight: .bold))
                        .foregroundColor(.white)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                    Divider()
                        .overlay(.white)
                    Spacer()
                    Text("\(desc)")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                    Spacer()
                }
            }
            //            .frame(width: 332, height: 452)
            .frame(height: 452)
            .padding(40)
            .background(
                Image("\(selectBackground())")
                    .resizable()
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(selectBorder(), lineWidth: 5)
                    )
            )
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
        
    }
    
    func selectBackground() -> String {
        var bg: String = ""
        if (category == "Technology") {
            bg = "Flashcards_Tech"
        } else if (category == "Design") {
            bg = "Flashcards_Design"
        } else if (category == "Accounting") {
            bg = "Flashcards_Accounting"
        } else if (category == "Game") {
            bg = "Flashcards_Game"
        }
        return bg
    }
    
    func selectBorder() -> Color {
            var border: Color = Color("Border_Tech")
            if (category == "Technology") {
                border = Color("Border_Tech")
            } else if (category == "Design") {
                border = Color("Border_Design")
            } else if (category == "Accounting") {
                border = Color("Border_Accounting")
            } else if (category == "Game") {
                border = Color("Border_Game")
            }
            return border
        }
}

//struct PlayAloneCardView_Preview: PreviewProvider {
//    static var previews: some View {
//        let viewContext = CoreDataManager.shared.container.viewContext
//        
//        PlayAloneCardView(base: "Artificial Intelligence", wrongAnswer: "AI", category: "Technology", desc: "Lorem Ipsum", cardCount: 10, currentCard: 1, playAloneVM: PlayAloneViewModel())
//            .environmentObject(JargonListViewModel(context: viewContext))
//    }
//}
