//
//  SnackBar.swift
//  Wordle
//
//  Created by Antonio Posabella on 25/02/22.
//

import SwiftUI

struct SnackBar: View {
	
	@Binding var isShowing: Bool
	private let presenting: AnyView
	private let text: Text
	private let action: (() -> Void)?
	
	
	init<Presenting>(isShowing: Binding<Bool>,
					 presenting: Presenting,
					 text: Text,
					 action: (() -> Void)? = nil) where Presenting: View {
		
		_isShowing = isShowing
		self.presenting = AnyView(presenting)
		self.text = text
		self.action = action
		
	}
	
	var body: some View {
		GeometryReader { geometry in
			ZStack(alignment: .center) {
				
				self.presenting
				VStack {
					Spacer()
					if self.isShowing {
						HStack {
							text
//								.font(Font.appReguler(size: 14))
								.foregroundColor(.white)
								.fixedSize(horizontal: false, vertical: true)
							
						}
						.padding()
						.frame(width: geometry.size.width * 0.9, height: 50)
						.shadow(radius: 3)
//						.background(Color("darkBlue"))
						.offset(x: 0, y: -20)
						.transition(AnyTransition.asymmetric(insertion: AnyTransition.move(edge: Edge.bottom),removal: AnyTransition.move(edge: Edge.trailing)))
						.animation(Animation.spring())
						.onAppear {
							DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
								withAnimation {
									self.isShowing = false
								}
							}
						}
					}
				}
			}
		}
	}
}


extension View {
	
	func snackBar(isShowing: Binding<Bool>,
				  text: Text,
				  action: (() -> Void)? = nil) -> some View {
		
		SnackBar(isShowing: isShowing,
				 presenting: self,
				 text: text,
				 action: action)
	}
}
