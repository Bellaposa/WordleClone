//
//  GameView.swift
//  Wordle
//
//  Created by Antonio Posabella on 15/02/22.
//

import SwiftUI

struct GameView: View {
	@EnvironmentObject var viewModel: WordleViewModel
	@State private var showSettings = false
	@State private var showSnackBar = false
	@State private var showHelp = false

	
	var body: some View {
		ZStack {
			NavigationView {
				VStack {
					if Global.screenHeight < 600 {
						Text("")
					}
					
					Spacer()
					VStack(spacing: 3) {
						ForEach(0...5, id: \.self) { index in
							GuessView(
								guess: $viewModel.guesses[index]
							)
								.modifier(
									Shake(
										animatableData: CGFloat(viewModel.incorrectAttempts[index]))
								)
						}
					}
					.frame(width: Global.boardWidth, height: 6 * Global.boardWidth / 5)
					
					Spacer()
					
					Keyboard()
						.scaleEffect(Global.keyboardScale)
						.padding(.top)
					
					Spacer()
				}
				.disabled(viewModel.showStats)
				.navigationBarTitleDisplayMode(.inline)
				
				.overlay(alignment: .top) {
					if let toastText = viewModel.toastText {
						ToastView(toastText: toastText)
							.offset(y: 20)
					}
				}
				.toolbar {
					ToolbarItem(placement: .navigationBarLeading) {
						HStack {
							if !viewModel.inPlay {
								Button { viewModel.newGame() } label: {
									Text("New")
										.foregroundColor(.primary)
								}
							}
							Button { showHelp.toggle() }
								label: {
									Image(systemName: "questionmark.circle")
							}
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
								withAnimation { viewModel.showStats.toggle() }
							} label: { Image(systemName: "chart.bar") }
							Button { showSettings.toggle() }
						label: { Image(systemName: "gearshape.fill") }
						}
					}
				}.sheet(isPresented: $showSettings) {
					SettingsView(isShowing: $showSettings)
				}
			}
			
			if viewModel.showStats { StatsView() }
		}
		.navigationViewStyle(.stack)
		.sheet(isPresented: $showHelp) {
			HelpView()
		}
	}
}

struct GameView_Previews: PreviewProvider {
	static var previews: some View {
		GameView()
			.environmentObject(WordleViewModel())
	}
}
