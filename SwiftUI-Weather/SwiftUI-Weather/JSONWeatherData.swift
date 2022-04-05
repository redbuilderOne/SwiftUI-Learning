
import Foundation

let apiKey = "2dc9faafa33654ff7fdbff65564d0f0f"

//MARK: -FROM NET
func pullJSONData(url: URL?, forecast: Bool) {
    let task = URLSession.shared.dataTask(with: url!) { data, response, error in
        if let error = error {
            print("Error: \(error.localizedDescription)")
        }

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            print("Error: HTTP Response Code Error")
            return
        }

        guard let data = data else {
            print("Error : No Responce")
            return
        }

        if (!forecast) {} else {
            decodeJSONForecast(JSONData: data)
        }
    }
    task.resume()
}

let city: String = "Moscow"
let url = URL(string: "api.openweathermap.org/data/2.5/forecast?lat=\(city)&appid=\(apiKey)&units=imperial")

struct WeatherData: Decodable {
    let list: [List]
}

struct Main: Decodable {
    let temp: Float
    let temp_max: Float
    let temp_min: Float
    let feels_like: Float
    let humidity: Float
}

struct Weather2: Decodable {
    let main: String
    let description: String
    let icon: String
}

struct List: Decodable {
    let main: Main
    let weather: [Weather2]
}

func decodeJSONForecast(JSONData: Data) {
    let response = try! JSONDecoder().decode(WeatherData.self, from: JSONData)

    for i in response.list {
        print("Temp: \(i.main.temp)")
        mainTemp = i.main.temp
        print("Temp Max: \(i.main.temp_max)")
        mainTempMax = i.main.temp_max
        print("Temp Min: \(i.main.temp_min)")
        mainTempMin = i.main.temp_min
        print("Feels Like: \(i.main.feels_like)")
        feelsLike = i.main.feels_like
        print("Humidity: \(i.main.humidity)")
        humidity = i.main.humidity
        for j in i.weather {
            print("Main: \(j.main)")
            print("Description: \(j.description)")
            print("Icon: \(j.icon)")
        }
    }
}

var mainTemp = Float()
var mainTempMax = Float()
var mainTempMin = Float()
var feelsLike = Float()
var humidity = Float()

var b: () = pullJSONData(url: url, forecast: true)

//MARK: -One more attempt

struct WeatherCity: Decodable {
    var london: City?
}

struct City: Decodable {
    var temperature: String
    var weather: String
}

func getJSONData(url: URL?) {
    URLSession.shared.dataTask(with: url!) { (data, response, error) in

        guard let data = data else { return }
        guard error == nil else { return }

        do {
            let cityWeather = try JSONDecoder().decode(WeatherCity.self, from: data)
            print(cityWeather)
        } catch let error {
            print(error)
        }
    }
    .resume()
}
