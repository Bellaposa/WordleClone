//
//  Keyboard.swift
//  Wordle
//
//  Created by Antonio Posabella on 15/02/22.
//

import SwiftUI

struct Keyboard: View {
	@EnvironmentObject var viewModel: WordleViewModel
	var topRowArray = "QWERTYUIOP".map{ String($0) }
	var secondRowArray = "ASDFGHJKL".map{ String($0) }
	var thirdRowArray = "ZXCVBNM".map{ String($0) }
	var body: some View {
		VStack {
			HStack(spacing: 2) {
				ForEach(topRowArray, id: \.self) { letter in
					LetterButtonView(letter: letter)
				}
			}
			HStack(spacing: 2) {
				ForEach(secondRowArray, id: \.self) { letter in
					LetterButtonView(letter: letter)
				}
			}
			HStack(spacing: 2) {
			
				deleteButton
				
				ForEach(thirdRowArray, id: \.self) { letter in
					LetterButtonView(letter: letter)
				}
				
				enterButton
			}
		}
	}
	
	var enterButton: some View {
		Button { viewModel.enterWord() }
			label: { Text("Enter") }
			.font(.system(size: 20))
			.frame(width: 60, height: 50)
			.foregroundColor(.primary)
			.background(Color.unused)
	}
	
	var deleteButton: some View {
		Button { viewModel.removeLetterFromCurrentWord() } label: {
			Image(systemName: "delete.backward.fill")
				.font(.system(size: 20, weight: .heavy))
				.frame(width: 40, height: 50)
				.foregroundColor(.primary)
				.background(Color.unused)
		}
	}
}

struct Keyboard_Previews: PreviewProvider {
	static var previews: some View {
		Keyboard()
			.environmentObject(WordleViewModel())
			.scaleEffect(Global.keyboardScale)
	}
}
