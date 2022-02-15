//
//  GameView.swift
//  Wordle
//
//  Created by Antonio Posabella on 15/02/22.
//

import SwiftUI

struct GameView: View {
	@EnvironmentObject var viewModel: WordleViewModel
	var body: some View {
		NavigationView {
			VStack {
				Spacer()
				VStack(spacing: 3) {
					GuessView(guess: $viewModel.guesses[0])
					GuessView(guess: $viewModel.guesses[1])
					GuessView(guess: $viewModel.guesses[2])
					GuessView(guess: $viewModel.guesses[3])
					GuessView(guess: $viewModel.guesses[4])
				}
				.frame(width: Global.boardWidth, height: 5 * Global.boardWidth / 5)
				Spacer()
				Keyboard()
					.scaleEffect(Global.keyboardScale)
					.padding(.top)
				Spacer()
			}
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .navigationBarLeading) {
					Button {
						
					} label: {
						Image(systemName: "questionmark.circle")
					}
				}
				ToolbarItem(placement: .principal) {
					Text("WORDLE")
						.font(.largeTitle)
						.fontWeight(.heavy)
						.foregroundColor(.primary)
				}
				ToolbarItem(placement: .navigationBarTrailing) {
					HStack {
						Button {
							
						} label: {
							Image(systemName: "chart.bar")
						}
						Button {
							
						} label: {
							Image(systemName: "gearshape.fill")
						}
					}
				}
			}
		}
		.navigationViewStyle(.stack)
	}
}

struct GameView_Previews: PreviewProvider {
	static var previews: some View {
		GameView()
			.environmentObject(WordleViewModel())
			.previewInterfaceOrientation(.portraitUpsideDown)
	}
}
