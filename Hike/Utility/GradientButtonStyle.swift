//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Muhammet Eren on 11.10.2023.
//

import Foundation
import SwiftUI
struct GradientButton:ButtonStyle{
    func makeBody(configuration:Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal,30)
            .background(
                configuration.isPressed ?
                LinearGradient(colors: [.customGrayLight,.customGrayMedium],
                    startPoint: .top,
                    endPoint: .bottom)
                :
                    LinearGradient(colors: [.customGrayLight,.customGrayMedium],
                        startPoint: .top,
                        endPoint: .bottom)
            )
            .cornerRadius(40)
    }
}
