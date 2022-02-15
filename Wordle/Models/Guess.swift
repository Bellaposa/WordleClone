//
//  Guess.swift
//  Wordle
//
//  Created by Antonio Posabella on 15/02/22.
//

import SwiftUI

struct Guess {
	let index: Int
	var word = "     "
	var bgColors = [Color](repeating: .systemBackground, count: 5)
	var cardFlipped = [Bool](repeating: false, count: 5)
	var guessLetters: [String] {
		word.map { String($0) }
	}
}