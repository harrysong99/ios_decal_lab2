/*
 Partner 1 Name + Email:
 Partner 2 Name + Email:
 */
/*:
 ## Lab 2: Workplace
 
 Please refer to the [lab spec](http://iosdev.berkeley.edu/fa19/lab/lab2/) for further instructions.
 
 ### Part 1: Implementing Protocols and Extensions
 */


// YOUR CODE HERE

// Create a protocol called Payable.

protocol Payable {
    // one function requirement, wages(), that takes in no arguments but returns back a Double.
    func wages() -> Double
}

// Create an extenstion on Payable protocol and implement the wages() function.

extension Payable {
    // should just return back 50,000.00
    func wages() -> Double {
        return 50_000.00
    }
}

/*
 Create another protocol called TimeOff which includes a property named vacationDays of type Int
 that will be both gettable and settable.
 */

protocol TimeOff {
    var vacationDays: Int { get set }
    // create a function called requestForVacation which takes in one arugment named days of type Int and returns a Bool.
    func requestForVacation(_ days: Int) -> Bool
}

// Create an extension on the TimeOff protocol where requestForVacation(_:) function, you should return true if and only if there are enough vacationDays to satisfy the request.

extension TimeOff {
    func requestForVacation (_ days: Int) -> Bool {
        if days <= vacationDays {
            return true
        }
        return false
    }
}

// Create an enum called Task which has three cases: spreadsheet, emails and coffee.

enum Task {
    // enumeration definition goes here
    case spreadsheet
    case emails
    case coffee
}

// Create a protocol called Work which requires that there be one function. That one function should be called doWork(_:) which takes in one argument task of type Task. It should return a String.

protocol Work {
    func doWork(_ task : Task) -> String
}

// Create an extension on Work and provide a default implementation of the doWork(_:) function. In your implementation, you should switch on the task argument and return the following String based upon the specific case.

extension Work {
    func doWork(_ task : Task) -> String {
        switch task {
        case .spreadsheet:
            return "Balancing the company budget"
        case .emails:
            return "Checking emails"
        case .coffee:
            return "Getting coffee"
        }
    }
}
/*:
 ### Part 2: Putting It All Together
 */


// YOUR CODE HERE

// Create a new struct called Manager which has two instance properties (both of which should be variables).

struct Manager {
    var name: String
    var vacationDays: Int = 30
    // takes in no arguments, returns a Double), but you should return 100_000.00 instead.
    func wages() -> Double {
        return 100_000.00
    }
}

// Extend the Manager struct and adopt the following the following protocols in this extension

extension Manager: Employee {
    // Do not implement any functions within this extension. You are just adopting the various protocols.
}

// Create a struct called Worker which has two instance properties (both should be variables): one called name of type String; the other is called vacationDays of type Int with a default value of 15. Don't implement the wages() function.

struct Worker {
    var name: String
    var vacationDays: Int = 15
}

extension Worker: Employee, Work {
    // Do not implement anything in this extension, it should be blank.
}

// we can create an Employee protocol which adopts both the Payable and TimeOff protocols to make our lives easier in the long run

protocol Employee: Payable, TimeOff {
    // be empty inside
}
/*:
 #
 
 
 ### Test cases
 
 Uncomment and run these as a sanity check
 */

 struct FakePerson: Payable, TimeOff, Work {
 var vacationDays: Int = 15
 }
 
 var testPerson = FakePerson()
 testPerson.wages()                   // Should return 50,000
 testPerson.requestForVacation(15)    // Should return true
 testPerson.requestForVacation(16)    // Should return false
 testPerson.vacationDays = 0
 testPerson.requestForVacation(1)     // Should return false
 testPerson.doWork(.coffee)           // Should return "Getting coffee"
 testPerson.doWork(.emails)           // Should return "Checking emails"
 testPerson.doWork(.spreadsheet)      // Should return "Balancing the company budget"
 
 var testManager = Manager(name: "Riley", vacationDays: 30)
 var testWorker = Worker(name: "Quinn", vacationDays: 15)
 testManager.wages()                  // Should return 100,000
 testManager.requestForVacation(15)   // Should return true
 testManager.requestForVacation(31)   // Should return false
 testWorker.wages()                   // Should return 50,000
 testWorker.requestForVacation(15)    // Should return true
 testWorker.requestForVacation(16)    // Should return false
 testWorker.doWork(.coffee)           // Should return "Getting coffee"
 
