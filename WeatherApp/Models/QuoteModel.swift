//
//  QuoteModel.swift
//  WeatherApp
//
//  Created by Gustavo Binder on 26/06/23.
//



var temperaturas = [6, 11.9, 17.9, 24, 27, 32.9]
var frases = ["congelante", "muito frio", "frio", "ameno", "quente", "muito quente", "extremamente quente"]

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
        if (weatherModel.precipitation == "")
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
        
        print("\(weatherModel.temperature.value)")
        
        return get_phrase(aux)
    }
    
    var quote : String
    {
        if (vento == "" && chuva == "")
        {
            return "Está \(temp)."
        }
        else if (vento == "")
        {
            return "Está \(temp) e \(chuva)."
        }
        else if (chuva == "")
        {
            return "Está \(temp) e \(vento)."
        }
        
        return "Está \(temp), \(chuva) e \(vento)."
    }
    
    return quote
}
