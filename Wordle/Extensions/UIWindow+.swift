//
//  UIWindow+.swift
//  Wordle
//
//  Created by Antonio Posabella on 24/02/22.
//

import SwiftUI

extension UIWindow {
	static var key: UIWindow? {
		guard let scene = UIApplication.shared.connectedScenes.first,
			  let windowSceneDelegate = scene.delegate as? UIWindowSceneDelegate,
			  let window = windowSceneDelegate.window else {
				  return nil
			  }
		return window
	}
}

extension View {
	@ViewBuilder
	func applyIf<M: View>(condition: Bool, transform: (Self) -> M) -> some View {
		if condition {
			transform(self)
		} else {
			self
		}
	}
}

extension Bool {
	static var iOS15: Bool {
		if #available(iOS 15, *) {
			return true
		}
		return false
	}
}
