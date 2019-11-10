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

enum ScoopEvent {
    case lift
    case omit
    case turn
}

class Scoop {
    private let width = 200
    private let height = 100
    private let depth = 50
    private var state = false
    
    func isOn(state: Bool) {
        self.state = state
    }
    
    func move(event: ScoopEvent) {
        switch event {
        case .lift:
            print("lift")
        case .omit:
            print("omit")
        case .turn:
            print("turn")
        }
    }
}

class Tractor: Car {
    private let scoop = Scoop()
    override func turnOnOffEngine(turn: Bool) {
        engine.turnOnEngine()
        scoop.isOn(state: turn)
    }
}

var car = Car(mark: "BMW")
var display = Display(engine: car.engine, car: car)
car.turnOnOffEngine(turn: true)
car.drivingMode(transmission: .sport)
car.useDisplay(display: display)

//map
let name = ["Peter", "Vladimir", "Ivan", "Rouse"]
let countLetters = name.map{($0 + ": \($0.count)")}
print(name)
print(countLetters)

let array = ["Peter", "Vladimir", "Ivan", "Rouse"]
let newArray = array.map { $0.count > 5}
print(newArray)

//reduce
let intArray = [1, 2, 3, 4, 5]
let reduseSet = intArray.reduce(10) { $0 + $1}
print(reduseSet)

let text = ["Hello", "Swift", "!"]
let newText = text.reduce("", +)
print(newText)

//sort
var names = ["Jemima", "Peter", "David", "Kelly", "Isabella"]
names.sort{ $0.count > $1.count }
print(names)

var numbers = [9, 2, 4, 7, 6, 3]
numbers.sort {
    $0 < $1
}
print(numbers)
