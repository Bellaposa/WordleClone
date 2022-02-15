//
//  WordleViewModel.swift
//  Wordle
//
//  Created by Antonio Posabella on 15/02/22.
//

import SwiftUI

class WordleViewModel: ObservableObject {
	@Published var guesses: [Guess] = []
	
	var keyColors = [String : Color]()
	
	init() { newGame() }
	
	func newGame() {
		populateDefaults()
	}
	
	func populateDefaults() {
		guesses = []
		for index in 0...5 {
			guesses.append(Guess(index: index))
		}
		// reset keyboard colors
		let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
		for char in letters {
			keyColors[String(char)] = .unused
		}
	}
	
	// MARK: - Game Play
	func addToCurrentWord(_ letter: String) { }
	
	func enterWord() { }
	
	func removeLetterFromCurrentWord() { }
}
