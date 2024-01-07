//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Bishwajit Kalita on 03/01/24.
//

import Foundation

struct WeatherData: Codable {
    let location: Location
    let current: CurrentWeather
    let forecast: Forecast
}

struct Location: Codable {
    let name, region, country: String
    let lat, lon: Double
    let tzID: String
    let localtimeEpoch: Int
    let localtime: String

    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}

struct CurrentWeather: Codable {
    let lastUpdatedEpoch: Int
    let lastUpdated: String
    let tempC: Double
    let tempF: Double
    let isDay: Int
    let condition: WeatherCondition
    let windMPH, windKPH, windDegree: Double
    let windDir: String
    let pressureMB: Int
    let pressureIN, precipMM, precipIN: Double
    let humidity, cloud: Int
    let feelslikeC, feelslikeF: Double
    let visKM, visMiles: Double
    let uv: Int
    let gustMPH, gustKPH: Double

    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMPH = "wind_mph"
        case windKPH = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMB = "pressure_mb"
        case pressureIN = "pressure_in"
        case precipMM = "precip_mm"
        case precipIN = "precip_in"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case visKM = "vis_km"
        case visMiles = "vis_miles"
        case uv
        case gustMPH = "gust_mph"
        case gustKPH = "gust_kph"
    }
}

struct WeatherCondition: Codable {
    let text, icon: String
    let code: Int
}

struct Forecast: Codable {
    let forecastday: [ForecastDaydata]
}

struct ForecastDaydata: Codable {
    let date: String
    let dateEpoch: Int
    let day: Day
    let astro: Astro
    let hour: [Hour]
    
    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day, astro, hour
    }
}

struct Day: Codable {
    let maxtempC, maxtempF, mintempC, mintempF: Double
    let avgtempC, avgtempF, maxwindMph, maxwindKph: Double
    let totalprecipMm, totalprecipIn, totalsnowCm: Double
    let avgvisKm, avgvisMiles: Double
    let avghumidity, dailyWillItRain, dailyChanceOfRain, dailyWillItSnow: Int
    let dailyChanceOfSnow: Int
    let condition: WeatherCondition
    let uv: Double
    
    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case maxtempF = "maxtemp_f"
        case mintempC = "mintemp_c"
        case mintempF = "mintemp_f"
        case avgtempC = "avgtemp_c"
        case avgtempF = "avgtemp_f"
        case maxwindMph = "maxwind_mph"
        case maxwindKph = "maxwind_kph"
        case totalprecipMm = "totalprecip_mm"
        case totalprecipIn = "totalprecip_in"
        case totalsnowCm = "totalsnow_cm"
        case avgvisKm = "avgvis_km"
        case avgvisMiles = "avgvis_miles"
        case avghumidity
        case dailyWillItRain = "daily_will_it_rain"
        case dailyChanceOfRain = "daily_chance_of_rain"
        case dailyWillItSnow = "daily_will_it_snow"
        case dailyChanceOfSnow = "daily_chance_of_snow"
        case condition
        case uv
    }
}

struct Astro: Codable {
    let sunrise, sunset, moonrise, moonset: String
    let moonPhase: String
    let moonIllumination, isMoonUp, isSunUp: Int

    enum CodingKeys: String, CodingKey {
        case sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case moonIllumination = "moon_illumination"
        case isMoonUp = "is_moon_up"
        case isSunUp = "is_sun_up"
    }
}

struct Hour: Codable {
    let timeEpoch: Int
    let time: String
    let tempC, tempF: Double
    let isDay: Int
    let condition: WeatherCondition
    let windMph, windKph, windDegree: Double
    let windDir: String
    let pressureMb, pressureIn, precipMm, precipIn: Double
    let snowCm, humidity, cloud: Double
    let feelslikeC, feelslikeF, windchillC, windchillF: Double
    let heatindexC, heatindexF, dewpointC, dewpointF: Double
    let willItRain, chanceOfRain, willItSnow, chanceOfSnow: Int
    let visKm, visMiles, gustMph, gustKph, uv: Double
    
    enum CodingKeys: String, CodingKey {
        case timeEpoch = "time_epoch"
        case time
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMb = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case snowCm = "snow_cm"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case windchillC = "windchill_c"
        case windchillF = "windchill_f"
        case heatindexC = "heatindex_c"
        case heatindexF = "heatindex_f"
        case dewpointC = "dewpoint_c"
        case dewpointF = "dewpoint_f"
        case willItRain = "will_it_rain"
        case chanceOfRain = "chance_of_rain"
        case willItSnow = "will_it_snow"
        case chanceOfSnow = "chance_of_snow"
        case visKm = "vis_km"
        case visMiles = "vis_miles"
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
        case uv
    }
}
