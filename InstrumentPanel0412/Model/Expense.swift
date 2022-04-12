//
//  Expense.swift
//  InstrumentPanel0412
//
//  Created by 张亚飞 on 2022/4/12.
//

import SwiftUI

struct Expense: Identifiable {
    
    var id = UUID().uuidString
    var icon: String
    var title: String
    var subTitle: String
    var amount: String
}

var expenses: [Expense] = [

    Expense(icon: "Food", title: "Food", subTitle: "K Food Restaurant", amount: "$145.00"),
    Expense(icon: "Taxi", title: "Taxi", subTitle: "Taxi payment", amount: "$45.90"),
    Expense(icon: "Netflix", title: "Netflix", subTitle: "Subscription", amount: "$22.00")
]

let months: [String] = ["Jan", "Feb", "Mar", "Apr", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
let progressArray: [CGFloat] = [0.1, 0.4, 0.9, 0.5, 0.3, 0.8, 0.6, 0.2, 0.89, 0.45, 0.98, 0.32]
