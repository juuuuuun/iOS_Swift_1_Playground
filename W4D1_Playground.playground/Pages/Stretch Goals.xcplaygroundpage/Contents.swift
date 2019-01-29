//: [Previous](@previous)
/*:
 ## Stretch Goals
 - Callout(Stretch Goal 1):
 Earlier we learned about extensions to extend functionality of an existing class, struct or enum. We can take this a step further and we can have our extensions also conform to a protocol.
 \
In our earlier example, we added the 'square' function using our extension. Let's create a new protocol with the 'square' function. Then we can create an extension on any of the numbered types (`Int`, `Double`, `Float`, etc.) and have it conform to our new protocol
 \
Implement the 'square' function and test it out!
*/
protocol Squareable {
  func square() -> Self
}

extension Int: Squareable {
  func square() -> Int {
    return self * self
  }
}

extension Double: Squareable {
  func square() -> Double {
    return self * self
  }
}

extension Float: Squareable {
  func square() -> Float {
    return self * self
  }
}
/*:
 - Callout(Stretch Goal 2):
 Enums can have associated values with them to add extra information. For example, we can represent the different states of a consumer going through a purchasing transaction.
 \
Purchase States:
 - Checkout state with number of items
 - Purchasing state with type of payment (cash, credit, debit) and the total cost
 - Puchased state with a success or failure result
 
 
 Create the enums for these states and create a switch statement to handle each enum and print their associated values.
 */
enum ConsumerState {
  enum PaymentMethod {
    case Cash, Credit, Debit
  }
  enum PurchaseResult {
    case Success, Failure
  }
  case Checkout(numberOfItems: Int)
  case Purchasing(paymentMethod: PaymentMethod, totalCost: Double)
  case Purchased(result: PurchaseResult)
}

let state = ConsumerState.Purchasing(paymentMethod: .Cash, totalCost: 20.0)
switch state {
case .Checkout(let numberOfItems):
  print("Checking out \(numberOfItems) items")
case .Purchasing(let paymentMethod, let totalCost):
  print("Purchasing with \(paymentMethod) for \(totalCost) dollars")
case .Purchased(let result):
  print("Purchase \(result)")
}
/*:
 - Callout(Stretch Goal 3):
 Write a class to solve the following problem.
 */
//:
//: ### Problem: “How do we calculate a student’s grade for the term?”
//:
//: Each term has a midterm exam, a final exam, and a paper to write.
//: Each piece has a weighted percentage
//: All exams and papers are scored out of 100
//:
//: Exam weight is 30%, paper weight is 40%
//:
//: Formula to calculate student's grade:
//: (midtermExam * examWeight) + (finalExam * examWeight) + (paperScore * paperWeight)
//:
//: Grade Scale:
//: A > 80, B > 70, C > 60, D > 50, F < 50
//:
//: Requirements:
//: We need to convert the student’s grade to an overall grade and letter grade for the term
class StudentGrade {
  var midterm: Int
  var final: Int
  var paper: Int
  init(midterm: Int, final: Int, paper: Int) {
    self.midterm = midterm
    self.final = final
    self.paper = paper
  }
  
  func finalGrade() -> Double {
    return Double(midterm) * 0.3 + Double(final) * 0.3 + Double(paper) * 0.4
  }
  func letterGrade() -> String{
    switch finalGrade() {
    case 0..<50:
      return "F"
    case 50..<60:
      return "D"
    case 60..<70:
      return "C"
    case 70..<80:
      return "B"
    case 80...100:
      return "A"
    default:
      return "Something went wrong"
    }
  }
}
