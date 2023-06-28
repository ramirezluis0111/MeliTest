//
//  NumberFormatter.swift
//  MeliTest
//
//  Created by LuisR on 24/06/2023.
//

import Foundation

extension NumberFormatter {
    func formatCurrency(value: Double) -> String? {
        numberStyle = .currency
        maximumFractionDigits = 0
        locale = Locale.current

        if let formattedValue = string(from: NSNumber(value: value)) {
            return formattedValue.replacingOccurrences(of: ",", with: ".")
        }
        
        return nil
    }
}
