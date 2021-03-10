//
//  Reducer.swift
//  SwiftUI_Redux_tutorial
//
//  Created by Seokhyun Kim on 2021-03-09.
//

import Foundation

//inout : State가 매계변수를 들어 올때 값을 변경하는 키워드.
//Reducer<State, Action> 사용한다.
typealias Reducer<State, Action> = (inout State, Action) -> Void

//필터링을 하는 메서드
func appReducer(_ state: inout AppState, _ action: AppAction) -> Void {
    switch action {
    case .rollTheDice:
        //앱의 상태를 변경하기
        state.currentDice = ["⚀", "⚁", "⚂", "⚃", "⚄", "⚅"].randomElement() ?? "⚀"
    }
}
