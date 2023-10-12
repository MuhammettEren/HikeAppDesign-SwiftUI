//
//  CardView.swift
//  Hike
//
//  Created by Muhammet Eren on 11.10.2023.
//

import SwiftUI

struct CardView: View {
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    func randomImage(){
        print("---BUTTON WAS PRESSED---")
        print("Status:Old Image Number = \(imageNumber)")
        repeat{
            randomNumber = Int.random(in: 1...5)
            print("Action: Random Number Generated = \(randomNumber)")
        }while randomNumber == imageNumber
        imageNumber = randomNumber
        print("Result: New Image Number = \(imageNumber)")
        print("--- THE END ---")
        print("\n")
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                VStack(alignment:.leading){
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(LinearGradient(colors: [.customGrayLight,.customGrayMedium],
                                startPoint: .top,
                                endPoint: .bottom)
                        )
                        Spacer()
                        Button{
                            print("Button was pressed")
                            isShowingSheet.toggle()
                        }label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet){
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium,.large])// sheet hangi konumda nasıl gözükür onu belirlemek için
                        }
                    }
                    
                    Text("Fun and enjoyable outdoor activity for friends")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.customGrayMedium)
                }
                .padding(.horizontal,30)
                ZStack {
                   CustomCircleView()
                    Image("image-\(imageNumber)")
                          .resizable()
                          .scaledToFit()
                          .animation(.default, value: imageNumber)
                }
                Button{
                    randomImage()
                }label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [.customGreenLight,.customGreenMedium],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .shadow(color: .black.opacity(0.25), radius: 0.25,x: 1,y: 2)
                }
                .buttonStyle(GradientButton())
                   
            }
        }
        .frame(width: 320,height: 570)
    }
}

#Preview {
    CardView()
}
