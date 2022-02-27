//
//  SettingView.swift
//  Wordle
//
//  Created by Antonio Posabella on 24/02/22.
//

import SwiftUI


struct SettingsView: View {
	@EnvironmentObject var viewModel: WordleViewModel
	@EnvironmentObject var csManager: ColorSchemeManager
	@Binding var isShowing: Bool
	var body: some View {
		NavigationView {
			VStack {
				Toggle("Hard Mode", isOn: $viewModel.hardMode)
				Text("Change Theme")
				Picker("Display Mode", selection: $csManager.colorScheme) {
					Text("Dark").tag(ColorScheme.dark)
					Text("Light").tag(ColorScheme.light)
					Text("System").tag(ColorScheme.unspecified)
				}
				.pickerStyle(.segmented)
				Spacer()
			}.padding()
				.navigationTitle("Options")
				.navigationBarTitleDisplayMode(.inline)
				.toolbar {
					ToolbarItem(placement: .navigationBarTrailing) {
						Button { isShowing.toggle() }
					label: { Text("**X**") }
					}
				}
		}
	}
}

struct SettingsView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsView(
			isShowing: .constant(true)
		)
			.environmentObject(ColorSchemeManager())
			.environmentObject(WordleViewModel())
		
	}
}
