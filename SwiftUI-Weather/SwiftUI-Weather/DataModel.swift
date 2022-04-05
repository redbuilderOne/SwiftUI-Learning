

import SwiftUI

enum DayOfWeekEnum: String {
    case monday = "MON"
    case tuesday = "TUE"
    case wednesday = "WED"
    case thursday = "THU"
    case friday = "FRI"
    case saturday = "SAT"
    case sunday = "SUN"
}

enum ImageNameEnum: String {
    case cloudy = "cloud.sun.fill"
    case sunny = "sun.max.fill"
    case windy = "wind.snow"
    case sunset = "sunset.fill"
    case snowy = "snow"
}

struct DayOfWeek {
    var dayOfWeek: DayOfWeekEnum
    var imageName: ImageNameEnum
    var temperature: Int
}

let mon = DayOfWeek(dayOfWeek: DayOfWeekEnum.monday, imageName: ImageNameEnum.cloudy, temperature: 66)
let tue = DayOfWeek(dayOfWeek: DayOfWeekEnum.tuesday, imageName: ImageNameEnum.sunny, temperature: 74)
let wed = DayOfWeek(dayOfWeek: DayOfWeekEnum.wednesday, imageName: ImageNameEnum.windy, temperature: 45)
let thu = DayOfWeek(dayOfWeek: DayOfWeekEnum.thursday, imageName: ImageNameEnum.snowy, temperature: 32)
let fri = DayOfWeek(dayOfWeek: DayOfWeekEnum.friday, imageName: ImageNameEnum.sunset, temperature: 51)
let sat = DayOfWeek(dayOfWeek: DayOfWeekEnum.saturday, imageName: ImageNameEnum.sunny, temperature: 71)
let sun = DayOfWeek(dayOfWeek: DayOfWeekEnum.sunday, imageName: ImageNameEnum.cloudy, temperature: 65)


let arrayOfDays = [day1, day2, day3, day4, day5]
let day1 = WeatherDayView(dayOfWeek: DayOfWeekEnum.monday.rawValue, imageName: ImageNameEnum.cloudy.rawValue, temperature: mon.temperature)
let day2 = WeatherDayView(dayOfWeek: DayOfWeekEnum.tuesday.rawValue, imageName: ImageNameEnum.sunny.rawValue, temperature: tue.temperature)
let day3 = WeatherDayView(dayOfWeek: DayOfWeekEnum.wednesday.rawValue, imageName: ImageNameEnum.cloudy.rawValue, temperature: wed.temperature)
let day4 = WeatherDayView(dayOfWeek: DayOfWeekEnum.thursday.rawValue, imageName: ImageNameEnum.snowy.rawValue, temperature: thu.temperature)
let day5 = WeatherDayView(dayOfWeek: DayOfWeekEnum.friday.rawValue, imageName: ImageNameEnum.windy.rawValue, temperature: fri.temperature)


