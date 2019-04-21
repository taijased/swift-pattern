
import Foundation


protocol PropertyObserver {
    func didGet(newTask task: String)
}
protocol Subject {
    func add(observer: PropertyObserver)
    func remove(observer: PropertyObserver)
    func notify(withString: String)
}

class Teacher: Subject {
    
    var observerCollection = NSMutableSet()
    var homeTask = "" {
        didSet {
            notify(withString: homeTask)
        }
    }
    
    func add(observer: PropertyObserver) {
        observerCollection.add(observer)
    }
    
    func remove(observer: PropertyObserver) {
        observerCollection.remove(observer)
    }
    
    func notify(withString: String) {
        for observer in observerCollection {
            (observer as! PropertyObserver).didGet(newTask: withString)
        }
    }
    
    
}

class Pupil: NSObject, PropertyObserver {
    
    var homeTask = ""
    func didGet(newTask task: String) {
        homeTask = task
        print("home work to be done ")
    }
}


let teacher = Teacher()

let pupil = Pupil()

teacher.add(observer: pupil)
teacher.homeTask = "Прочитать Война и Мир!"

pupil.homeTask

