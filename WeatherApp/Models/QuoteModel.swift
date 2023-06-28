//
//  QuoteModel.swift
//  WeatherApp
//
//  Created by Gustavo Binder on 26/06/23.
//

var temperaturas = [0, 5, 9, 13, 17, 19, 24, 27, 32.9]
var frases = ["Congelante", "Gelado", "Muito frio", "Frio", "Friozinho", "Fresco", "Ameno", "Quente", "Muito quente", "Extremamente quente"]

func get_phrase(_ temperatura: Double) -> String
{
    let temp = temperatura
    
    for t in 0...temperaturas.count
    {
        if (temp < temperaturas[t])
        {
            return frases[t]
        }
    }
    
    return frases[6]
}

func make_quote(_ weatherModel : WeatherModel) -> String
{
    
    var vento : String {
        if (weatherModel.wind.value > 6)
        {
            return "ventando"
        }
        return ""
    }
    
    var chuva : String
    {
        if (weatherModel.precipitation.value < 0.1)
        {
            return ""
        }
        return "chovendo"
    }
    
    var temp : String
    {
        var aux : Double
        
        aux = weatherModel.temperature.value
        
        if weatherModel.temperature.unit == .fahrenheit
        {
            aux = ((weatherModel.temperature.value - 32) * 5) / 9
        }
        
        return get_phrase(aux)
    }
    
    var quote : String
    {
        if (vento == "" && chuva == "")
        {
            return "\(temp)."
        }
        else if (vento == "")
        {
            return "\(temp) e \(chuva)."
        }
        else if (chuva == "")
        {
            return "\(temp) e \(vento)."
        }
        
        return "\(temp), \(chuva) e \(vento)."
    }
    
    return quote
}
