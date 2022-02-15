//
//  Color+.swift
//  Wordle
//
//  Created by Antonio Posabella on 15/02/22.
//

import SwiftUI

extension Color {
	
	static var wrong: Color {
		Color(UIColor(named: "wrong")!)
	}
	
	static var misplaced: Color {
		Color(UIColor(named: "misplaced")!)
	}
	
	static var correct: Color {
		Color(UIColor(named: "correct")!)
	}
	
	static var systemBackground: Color {
		Color(.systemBackground)
	}
}