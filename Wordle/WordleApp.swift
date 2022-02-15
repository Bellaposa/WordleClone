//
//  WordleApp.swift
//  Wordle
//
//  Created by Antonio Posabella on 15/02/22.
//

import SwiftUI

@main
struct WordleApp: App {
	@StateObject var vm = WordleViewModel()
	var body: some Scene {
		WindowGroup {
			GameView()
				.environmentObject(vm)
		}
	}
}
