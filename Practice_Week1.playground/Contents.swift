import UIKit
import CoreGraphics

class Car{
    let topSpeed: Int
    let brand: CarBrand
    let colour: CarColour
    var location: Location?
    var speed: Int = 0   //Instantaneous speed.
    var speedLimit: Int?
    var autocruiseON: Bool = false
    var remainingKilometerForService: Int = 10000
    var radioStations: [Double: String] = [89.00: "JOY TÜRK", 89.60: "KAFA RADYO", 90.80: "SUPER FM",92.00: "KRAL FM",
                                           97.20: "METRO FM", 98.40: "BEST FM"]
    
    init(brand: CarBrand, colour: CarColour, topSpeed: Int){
        
        self.topSpeed = topSpeed
        self.brand = brand
        self.colour = colour
        
    }
    
    func increaseTheSpeed() {
        if speed < topSpeed {
            self.speed = speed+10
        }
    }
    
    func decreaseTheSpeed() {
        if speed >= 10{
            self.speed = speed-10
            autocruiseON = false
        }
    }
    
    func speedLimitWarning() -> String {
        if speedLimit != nil{
            if speed > speedLimit!{
                return "SLOW DOWN, Speed Limit \(speedLimit!)"
            }
        }
        return ""
    }
    
    func autocruise(autocruiseSpeed: Int?) {
        guard let autocruiseSpeed = autocruiseSpeed else { return }
        
        if autocruiseSpeed > speed {
            autocruiseON = true
            while (speed < autocruiseSpeed) {
                increaseTheSpeed()
            }
        }
        else if autocruiseSpeed < speed {
            autocruiseON = true
            while (speed > autocruiseSpeed) {
                decreaseTheSpeed()
            }
        }
    }
}
struct Location {
    var latitude: Double?
    var longitude: Double?
}

enum CarBrand {
    case Mercedes
    case BMW
    case Audi
    case Citroen
}

enum CarColour {
    case Red
    case White
    case Black
    case Blue
    case Gray
}

var mercedes1 = Car(brand: .Mercedes, colour: .Black, topSpeed: 240)
var bmw1 = Car(brand: .BMW, colour: .Blue, topSpeed: 280)
var audi1 = Car(brand: .Audi, colour: .Gray, topSpeed: 280)
var citroen1 = Car(brand: .Citroen, colour: .White, topSpeed: 180)

var carCollection: [Car] = [mercedes1, bmw1, audi1, citroen1]
mercedes1.increaseTheSpeed()
mercedes1.speedLimit = 120
mercedes1.speedLimitWarning()
mercedes1.autocruise(autocruiseSpeed: 150)
mercedes1.speedLimitWarning()
