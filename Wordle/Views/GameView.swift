//
//  GameView.swift
//  Wordle
//
//  Created by Antonio Posabella on 15/02/22.
//

import SwiftUI

struct GameView: View {
	@EnvironmentObject var vm: WordleViewModel
	var body: some View {
		NavigationView {
			VStack(spacing: 3) {
				GuessView(guess: $vm.guesses[0])
				GuessView(guess: $vm.guesses[1])
				GuessView(guess: $vm.guesses[2])
				GuessView(guess: $vm.guesses[3])
				GuessView(guess: $vm.guesses[4])
				GuessView(guess: $vm.guesses[5])
			}
			.frame(width: Global.boardWidth, height: 6 * Global.boardWidth / 5)
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
