//
//  LetterButtonView.swift
//  Wordle
//
//  Created by Antonio Posabella on 15/02/22.
//

import SwiftUI

struct LetterButtonView: View {
	@EnvironmentObject var viewModel: WordleViewModel
	
	var letter: String
	var body: some View {
		Button { viewModel.addToCurrentWord(letter) }
			label: {
				Text(letter)
					.font(.system(size: 20))
					.frame(width: 35, height: 50)
					.background(viewModel.keyColors[letter])
					.foregroundColor(.primary)
		}
		.buttonStyle(.plain)
	}
}

struct LetterButtonView_Previews: PreviewProvider {
	static var previews: some View {
		LetterButtonView(letter: "K")
			.environmentObject(WordleViewModel())
	}
}
