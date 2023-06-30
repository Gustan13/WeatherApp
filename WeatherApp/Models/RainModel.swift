//
//  RainModel.swift
//  WeatherApp
//
//  Created by Gustavo Binder on 27/06/23.
//

import Foundation

let frases_chuva = ["Sem chuva", "Garoa", "Chuva fraca", "Chuva", "Chuva intensa", "Tempestade"]
let chuva_mm : [Double] = [0.1, 2, 6, 10, 18]

func get_rainphrase(rain: Double) -> String
{
    for i in 0...frases_chuva.count
    {
        if rain < chuva_mm[i]
        {
            return frases_chuva[i]
        }
    }
    return frases_chuva[5]
}
