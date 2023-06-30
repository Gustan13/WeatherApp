//
//  WindModel.swift
//  WeatherApp
//
//  Created by Gustavo Binder on 27/06/23.
//

import Foundation

let frases_vento = ["Sem vento", "Brisa Leve", "Brisa", "Vento", "Ventania", "Vendaval", "Tornado"]
let vento_vel : [Double] = [7, 11, 20, 40, 75, 118]

func get_windphrase(wind: Double) -> String
{
    for i in 0...frases_vento.count
    {
        if wind < vento_vel[i]
        {
            return frases_vento[i]
        }
    }
    
    return frases_vento[5]
}
