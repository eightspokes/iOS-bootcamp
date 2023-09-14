import UIKit
print("\n*********Even Numbers*********\n")
/* Create an array of Int called nums with values 0 through 20. Iterate over the Array and print the even numbers. */
var nums = Array(0...20)
for num in nums{
    if num % 2 == 0 {
        print (num)
    }
}
/*
 Iterate over sentence counting the vowels (a, e, i, o, u), ignoring the case.
*/

print("\n*********Vowels Count*********\n")
let sentence = "The qUIck bRown fOx jumpEd over the lAzy doG"
let vowels = "aeiou"
var vowelsCount = 0
for char in sentence.lowercased(){
    if vowels.contains(char){
        vowelsCount += 1
    }
}
print (vowelsCount)

print("\n*********Multiplication Table*********\n")
let array1 = Array(0...4)
let array2 = Array(0...4)
for num1 in array1{
    for num2 in array2{
        print("\(num1) * \(num2) = \(num1 * num2)")
    }
}

print("\n*********Average*********\n")
func average(of array: [Int]?){
    if let array{
        let total = array.reduce(0,+)
        let average = total/array.count
        print("The average of the values in the array is \(average)")
        
    }else{
        print("The array is nil. Calculating the average is impossible.")
    }
}
average(of: nums)
let nilArray: [Int]? = nil
average(of: nilArray)

print("\n*********Person-Student*********\n")
struct Person{
    var firstName: String
    var lastName: String
    var age: Int
    func details(){
        print( "Name: \(firstName) \(lastName), Age: \(age)")
    }
}
var person = Person(firstName: "Roman", lastName: "Kozulia", age: 37)
person.details()

class Student{
    var person: Person
    var grades: [Int]
    init(person: Person, grades: [Int]){
        self.person = person
        self.grades = grades
    }
    func calculateAverageGrade() -> Double{
        var total = grades.reduce(0,+)
        let average = Double(total / grades.count)
        return average
    }
    func details(){
        // format gpt to two decimal places
        let gpa = String(format: "%.2f", calculateAverageGrade())
        print("Name: \(person.firstName) \(person.lastName), Age: \(person.age), GPA: \(gpa)")
    }
}
let student = Student(person: person, grades: [94,99,81,100,79])
student.details()

print("\n*********Square-Rectangle*********\n")

struct Square {
  var side: Int
  func area() -> Int {
    return side * side
  }
}

class Rectangle {
  var length: Int
  var width: Int
  init(length: Int, width: Int) {
    self.length = length
    self.width = width
  }
  func area() -> Int {
    return length * width
  }
}

var square1 = Square(side: 4)
var square2 = square1
square2.side = 5
print("Area: square1 - \(square1.area()) square2 - \(square2.area())")

var rectangle1 = Rectangle(length: 4, width: 4)
var rectangle2 = rectangle1
rectangle2.length = 5
print("Area: rectangle1 - \(rectangle1.area()) rectangle2 - \(rectangle2.area())")

