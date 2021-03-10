//
//  DiceView.swift
//  SwiftUI_Redux_tutorial
//
//  Created by Seokhyun Kim on 2021-03-09.
//

//UI 부분
import Foundation
import SwiftUI

struct DiceView: View {
    //외부에서 EnvironmentObject()로 연결됨.
    @EnvironmentObject var store : AppStore
    
    @State private var shouldRoll = false
    @State private var pressed = false
    
    var diceRoolAnimation: Animation {
        Animation.spring()
    }
    //주사위 굴리기 액션을 실행
    func rollTheDice() {
        print(#fileID, #function, #line)
        self.shouldRoll.toggle()
        self.store.dispatch(action: .rollTheDice)
    }
    
    var body: some View {
        VStack {
            Text(self.store.state.currentDice)
                .font(.system(size: 300, weight: .bold, design: .monospaced))
                .foregroundColor(Color.init(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)))
                .rotationEffect(.degrees(shouldRoll ? 360 : 0))
                .animation(diceRoolAnimation)
            Button(action: {
                self.rollTheDice()
            }, label: {
                Text("Random 주사위 굴리기")
                    .fontWeight(.black)
            }).buttonStyle(MyButtonStyle())
            .scaleEffect(self.pressed ? 0.0 : 1.0)
            .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, pressing: { pressing in
                withAnimation(.easeInOut(duration: 0.2), {
                    self.pressed = pressing
                })
                
            }, perform: {})
        }
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
    }
}
