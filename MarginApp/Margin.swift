//
//  Margin.swift
//  MarginApp
//
//  Created by Igor Malyarov on 14.07.2020.
//

import Foundation

struct Ratio: Hashable {
    var markup: Double
    
    var margin: Double {
        get { 1 - 1/(markup + 1) }
        set { markup = newValue < 1 ? 1/(1 - newValue) - 1 : 0 }
    }
}
