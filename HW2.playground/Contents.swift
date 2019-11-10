import Foundation

class Engine {
    private (set) var speed: Float = 0.0
    private let maximumSpeed: Float = 200.0
    private var brake = false
    private (set) var isOnEngine = false

    func getMaximumSpeed() -> Float {
        return maximumSpeed
    }
    
    func getBrakeStatus() -> Bool {
        return brake
    }
    
    func brakeControl(isOn: Bool) {
        brake = isOn
    }
    
    func changeSpeed(speed: Float) {
        self.speed = speed
    }
    
    func turnOnEngine() {
        isOnEngine = true
    }
    
    func turnOffEngine() {
        isOnEngine = false
    }
    
}

class Display {
    private let engine: Engine
    private let car: Car
    
    init(engine: Engine, car: Car) {
        self.engine = engine
        self.car = car
    }
    
    func showDriveMode() {
        print("Mode: \(car.mode)")
    }
    
    func showMarkInfo() {
        print("Mark: \(car.mark)")
    }
    
    func showMoveInfo() {
        print("Move: \(engine.isOnEngine)")
    }
    
    func showCurrentSpeed() {
        print("Speed: \(engine.speed)")
    }
}

enum Transmission {
    case park
    case reverse
    case neutral
    case drive
    case sport
}

class Car {
    private (set) var mode: Character = "P"
    let engine = Engine()
    let mark: String
    
    init(mark: String) {
        self.mark = mark
    }
    
    func turnOnOffEngine(turn: Bool) {
        if turn {
            engine.turnOnEngine()
        } else {
            engine.turnOffEngine()
        }
    }
    
    func pressOnBrakes(isOn: Bool) {
        engine.brakeControl(isOn: isOn)
        engine.changeSpeed(speed: 0.0)
    }
    
    func useDisplay(display: Display) {
        display.showMarkInfo()
        display.showMoveInfo()
        display.showCurrentSpeed()
        display.showDriveMode()
    }
    
    func drivingMode(transmission: Transmission) {
        guard engine.isOnEngine != false && engine.getBrakeStatus() != true else { return }
        switch transmission {
        case .park:
            engine.changeSpeed(speed: 0.0)
            mode = "P"
        case .neutral:
            mode = "N"
        case .drive:
            engine.changeSpeed(speed: 100.0)
            mode = "D"
        case .sport:
            engine.changeSpeed(speed: engine.getMaximumSpeed())
            mode = "S"
        case .reverse:
            engine.changeSpeed(speed: 5.0)
            mode = "R"
        }
    }
}

var car = Car(mark: "BMW")
var display = Display(engine: car.engine, car: car)
car.turnOnOffEngine(turn: true)
car.drivingMode(transmission: .sport)
car.useDisplay(display: display)
