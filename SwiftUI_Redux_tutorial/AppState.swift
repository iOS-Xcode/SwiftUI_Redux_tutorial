//
//  AppState.swift
//  SwiftUI_Redux_tutorial
//
//  Created by Seokhyun Kim on 2021-03-09.
//

import Foundation

//앱의 상태 측 데이터
struct AppState {
    var currentDice: String = "" {
        didSet {
            print("currentDice : \(currentDice)", #fileID, #function)
        }
    }
    
}
