//
//  WordleViewModel.swift
//  Wordle
//
//  Created by Antonio Posabella on 15/02/22.
//

import SwiftUI

class WordleViewModel: ObservableObject {
	@Published var guesses: [Guess] = []
	
	init() { newGame() }
	
	func newGame() {
		populateDefaults()
	}
	
	func populateDefaults() {
		guesses = []
		for index in 0...5 {
			guesses.append(Guess(index: index))
		}
	}
}
