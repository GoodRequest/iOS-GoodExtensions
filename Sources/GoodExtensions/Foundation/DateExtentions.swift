//
//  Date.swift
//
//
//  Created by Andrej Jasso on 08/06/2021.
//  Copyright © 2020 GoodRequest. All rights reserved.
//

import Foundation
import GRCompatible

extension Date: GRCompatible {}

public extension GRActive where Base == Date {

    /// Adding return a new date with the added component
    ///
    /// - Parameters:
    ///   - number: Number of component value to be added
    ///   - component: Component to add
    /// - Returns: New date with added component
    func adding(number: Int, of component: Calendar.Component) -> Date {
        return Calendar.current.date(byAdding: component, value: number, to: base) ?? base
    }
    
    /// Calculates the age based on the given `birthday` date and the current date.
    ///
    /// - Parameter birthday: The date of birth.
    /// - Returns: The age in years.
    func getAge() -> Int {
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: base, to: Date())

        return ageComponents.year ?? 0
    }

    /// Returns the current date as a string in the specified `format`.
    ///
    /// - Parameter format: The date format string.
    /// - Returns: The current date as a string in the specified `format`.
    @available(iOS, deprecated: 15.0, message: "Deprecated, since iOS 15.0 you should use '.formatted()' instead.")
    func stringFromDate(format: String) -> String {
        return GRDateFormatter.shared.string(from: base, format: format)
    }

    /// Determines whether the given date is in the past.
    var isDateInPast: Bool { base < Date() }

    /// Determines whether the given date is in the future.
    var isDateInFuture: Bool { base > Date() }

}
