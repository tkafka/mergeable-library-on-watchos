//
//  MyEnum.swift
//  MyKit
//
//  Created by Tomas Kafka on 25.09.2023.
//

import Foundation

public enum MyEnum {
	case one, two
	
	public var str : String {
		switch self {
		case .one:
			return "one"
		case .two:
			return "two"
		}
	}
}
