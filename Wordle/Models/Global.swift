//
//  Global.swift
//  Wordle
//
//  Created by Antonio Posabella on 15/02/22.
//

import UIKit

enum Global {
	
	static var screenWidth: CGFloat {
		UIScreen.main.bounds.size.width
	}
	
	static var screenHeight: CGFloat {
		UIScreen.main.bounds.size.height
	}
	
	static var minDimension: CGFloat {
		min(screenWidth,screenHeight)
	}
	
	static var boardWidth: CGFloat {
		switch minDimension {
			case 0...320:
				return screenWidth - 55
			case 321...430:
				return screenWidth - 50
			case 431...1000:
				return 350
			default:
				return 500
		}
	}
	
	static var keyboardScale: CGFloat {
		switch minDimension {
			case 0...430:
				return screenWidth / 390
			case 431...1000:
				return CGFloat(1.2)
			default:
				return CGFloat(1.6)
		}
	}
	
	static var dictionaryPath: String {
		Bundle.main.path(forResource: "big5", ofType: "txt") ?? .init()
	}
	
	static var randomElement: String {
		var _words: [String] = []
		do {
			let content = try String(contentsOfFile: dictionaryPath)
			_words = content.split(separator: "\n").map(String.init)
		} catch {
			
		}
		
		return _words.randomElement()!
	}
}
