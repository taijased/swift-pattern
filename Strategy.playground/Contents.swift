
import Foundation


protocol SwimBehavior {
    func swim()
}


class ProfessionalSwimmer: SwimBehavior {
    func swim() {
        print("proffesional swimming")
    }
}

class NonSwimmer: SwimBehavior {
    func swim() {
        print("non swimming")
    }
}

protocol DiveBehavior {
    func dive()
}

class ProffesionalDive: DiveBehavior {
    func dive() {
         print("proffesional diving")
    }
}

class NewbeDiver: DiveBehavior {
    func dive() {
        print("newbe diving")
    }
}

class NoneDiver: DiveBehavior {
    func dive() {
        print("none diving")
    }
}

class Human {
    
    private var diveBehavior: DiveBehavior!
    private var swimBehavior: SwimBehavior!
   
    func performSwim() {
        swimBehavior.swim()
    }
    func performDive() {
        diveBehavior.dive()
    }
    func setSwimBehavior(sb: SwimBehavior) {
        self.swimBehavior = sb
    }
    func setDiveBehavior(db: DiveBehavior) {
        self.diveBehavior = db
    }
    func run() {
        print("runing")
    }
    
    init(swimBehavior: SwimBehavior, diveBehavior: DiveBehavior) {
        self.swimBehavior = swimBehavior
        self.diveBehavior = diveBehavior
    }
}


let human = Human(swimBehavior: ProfessionalSwimmer(), diveBehavior: ProffesionalDive())
human.setSwimBehavior(sb: NonSwimmer())
human.performDive()
human.performSwim()

