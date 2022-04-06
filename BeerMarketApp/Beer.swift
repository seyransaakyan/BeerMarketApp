//
//  Beer.swift
//  BeerMarketApp
//
//  Created by Seyran Saakyan on 05.04.2022.
//

import Foundation

class Beer{
    var type: Int
    var amount: Int
    var price: Int
    
    init(type: Int, amount: Int, price: Int) {
        self.type = type
        self.amount = amount
        self.price = price
    }
}
var beerOne = Beer(type: 1, amount: 100, price: 100)
var beerTwo = Beer(type: 2, amount: 100, price: 150)
var beerThree = Beer(type: 3, amount: 100, price: 80)

