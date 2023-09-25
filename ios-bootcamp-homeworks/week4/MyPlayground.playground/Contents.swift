import UIKit
var nums = Array(0...20)

print("*** HW 4 ***")
print("*** Average *** \n")
// Function from HW 3
func average(of array: [Int]?){
    if let array{
        let total = array.reduce(0,+)
        let average = total/array.count
        print("The average of the values in the array is \(average)")
        
    }else{
        print("The array is nil. Calculating the average is impossible.")
    }
}
// This array's parameter is not optional, it aslo returns double
func average(of array: [Int]) -> Double {
    var result: Double = 0
    if array.count == 0 {
        return result
    }else{
        result = Double(array.reduce(0,+) / array.count)
    }
    return result
}

// This array lets us pass a message for debugging purposes
func average(of array: [Int], withMessage message: String) -> Double {
    print(message)
    var result: Double = 0
    
    if array.count == 0 {
        return result
    }else{
        result = Double(array.reduce(0,+) / array.count)
    }
    return result
}

var result = average(of: nums)
print("Overloaded 1. Average of array nums is \(result)")
result = average(of: nums, withMessage: "Calculating average")
print("Overloaded 2. Average of array nums is \(result)")
print("\n*** Animal ****\n")

enum Animal {
    case Alpaca, Antelope, Bear, Badger, Bat
}
func soundMadeBy(_ animal: Animal){
    switch animal {
    case .Alpaca:
        print("\(animal) goes Scream")
    case .Antelope:
        print("\(animal) goes Snort")
    case .Bear:
        print("\(animal) goes Roar")
    case .Badger:
        print("\(animal) goes Growl")
    case .Bat:
        print("\(animal) goes Squeak")
    }
}

let animal1 = Animal.Alpaca
let animal2 = Animal.Bear
soundMadeBy(animal1)
soundMadeBy(animal2)

print("\n*** Closures and Collections ****\n")

nums = Array(0...100)
let numsWithNil = [79, nil, 80, nil, 90, nil, 100, 72]
let numsBy2 = Array(stride(from: 2, through: 100, by: 2))
let numsBy4 = Array(stride(from: 2, through: 100, by: 4))

print("\n*** Even numbers ****\n")
func eventNumbersArray(of array: [Int]) -> [Int] {
    array.filter({ $0 % 2 == 0})
}
let evenNumbers = eventNumbersArray(of: nums)
print(evenNumbers)

print("\n*** Sum of Array ****\n")
func sumOfArray(_ array: [Int?]) -> Int {
    let numbers = array.compactMap{$0} // filter out nil
    return numbers.reduce(0, +)
}
print(sumOfArray(numsWithNil))

print("\n*** Common Elements Set ****\n")
func commonElementsSet ( _ firstArray: [Int], _ secondArray: [Int]) -> Set<Int> {
   Set(firstArray).intersection(Set(secondArray))
}

let commmonElementsSetResult = commonElementsSet(numsBy2, numsBy4)
print(commmonElementsSetResult)

print("\n*** Square Struct ****\n")
struct Square{
    var sideLength: Double
    var area: Double {
        sideLength * sideLength
    }
}

let aSquare = Square(sideLength: 2.0)
print(aSquare.area)

print("\n*** Protocol ****\n")
protocol Shape {
    func calculateArea() -> Double
}

struct Circle: Shape{
    let radius: Double
    func calculateArea() -> Double {
        Double.pi * pow(radius, 2)
    }
}
struct Rectangle: Shape{
    let length: Double
    let width: Double
    func calculateArea() -> Double {
        length * width
    }
}

let circle = Circle(radius: 5)
print("Area of a circle with radius \(circle.radius) is \(circle.calculateArea())")
let rectangle = Rectangle(length: 5, width: 4)
print("Area of a rectangle with length \(rectangle.length)  and width \(rectangle.width) is \(rectangle.calculateArea())")

extension Shape {
    // For sphere only
    func calculateVolume(radius r: Double) -> Double{
        return (4/3) * Double.pi * pow (r,3)
    }
}

struct Shpere: Shape{
    let radius: Double
    func calculateArea() -> Double {
        4 * Double.pi * pow(radius, 2)
    }
}

let shpere = Shpere(radius: 5)
print("Area of a sphere with radius \(shpere.radius) is \(shpere.calculateArea()) Volume is \(shpere.calculateVolume(radius: shpere.radius))")
