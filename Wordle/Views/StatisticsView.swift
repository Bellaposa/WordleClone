//
//  StatisticsView.swift
//  Wordle
//
//  Created by Antonio Posabella on 22/02/22.
//

import SwiftUI

struct StatsView: View {
	@EnvironmentObject var viewModel: WordleViewModel
	var body: some View {
		VStack(spacing: 10) {
			HStack{
				Spacer()
				Button {
					withAnimation {
						viewModel.showStats.toggle()
					}
				} label: {
					Text("X")
				}
				.offset(x:20, y: 10)
			}
			Text("STATISTICS")
				.font(.headline)
				.fontWeight(.bold)
			HStack(alignment: .top) {
				SingleStat(value: viewModel.currentStat.games,
						   text: "Played")
				if viewModel.currentStat.games != 0 {
					SingleStat(value: Int(100 * viewModel.currentStat.wins/viewModel.currentStat.games),
							   text: "Win %")
				}
				SingleStat(value: viewModel.currentStat.streak,
						   text: "Current Streak")
					.fixedSize(horizontal: false, vertical: true)
				SingleStat(value: viewModel.currentStat.maxStreak,
						   text: "MAX Streak")
					.fixedSize(horizontal: false, vertical: true)
			}
			Text("GUESS DISTRIBUTION")
				.font(.headline)
				.fontWeight(.bold)
			VStack(spacing: 5) {
				ForEach (0..<6) { index in
					HStack {
						Text("\(index + 1)")
						if viewModel.currentStat.frequencies[index] == 0 {
							Rectangle()
								.fill(Color.wrong)
								.frame(width: 22, height: 20)
								.overlay(
									Text("0")
										.foregroundColor(.white)
								)
						} else {
							if let maxValue = viewModel.currentStat.frequencies.max() {
								Rectangle()
									.fill((viewModel.tryIndex == index && viewModel.gameOver)
										  ? Color.correct
										  : Color.wrong)
									.frame(width: CGFloat(viewModel.currentStat.frequencies[index])
										   / CGFloat(maxValue) * 210,
										   height: 20)
									.overlay(
										Text("\(viewModel.currentStat.frequencies[index])")
											.foregroundColor(.white)
											.padding(.horizontal,5),
										alignment: .trailing
									)
							}
						}
						Spacer()
					}
				}
			}
			Spacer()
		}
		.padding(.horizontal, 40)
		.frame(width: 320, height: 370)
		.background(
			RoundedRectangle(cornerRadius: 15)
						.fill(Color.systemBackground)
		)
		.padding()
		.shadow(color: .black.opacity(0.3), radius: 10)
		.offset(y: -70)
	}
}

struct StatsView_Previews: PreviewProvider {
	static var previews: some View {
		StatsView()
			.environmentObject(WordleViewModel())
	}
}

struct SingleStat: View {
	let value: Int
	let text: String
	var body: some View {
		VStack {
			Text("\(value)")
				.font(.largeTitle)
			Text(text)
				.font(.caption)
				.frame(width: 50)
				.multilineTextAlignment(.center)
		}
	}
}
