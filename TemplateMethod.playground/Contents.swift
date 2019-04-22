// Поведенческий паттерн

protocol DriveVehicle {
    func haveASeat()
    func useProtection()
    func lookAtTheMirror()
    func turnSignal()
    func driveForward()
    func startVehicle()
}


extension DriveVehicle {
    func startVehicle() {
        haveASeat()
        useProtection()
        lookAtTheMirror()
        turnSignal()
        driveForward()
    }
    func haveASeat() {
        preconditionFailure("this is method should be override")
    }
    func useProtection() {
        preconditionFailure("this is method should be override")
    }
    func lookAtTheMirror() {
        preconditionFailure("this is method should be override")
    }
    func turnSignal() {
        preconditionFailure("this is method should be override")
    }
    func driveForward() {
        preconditionFailure("this is method should be override")
    }
}

class Bicycle: DriveVehicle {
    func haveASeat() {
        print("sit down on a bicycle seat")
    }
    func useProtection() {
        print("wear a helmet")
    }
    func lookAtTheMirror() {
        print("look at the littlr mirror")
    }
    func turnSignal() {
        print("show left hand")
    }
    func driveForward() {
        print("pedal")
    }
}


class Car: DriveVehicle {
    func haveASeat() {
        print("sit down on a car seat")
    }
    func useProtection() {
        print("fasten seat belt")
    }
    func lookAtTheMirror() {
        print("look at the rearview mirror")
    }
    func turnSignal() {
        print("turn on left turn light")
    }
    func driveForward() {
        print("push pedal")
    }
}


let car = Car()
car.startVehicle()

print("----------")
let bicycle = Bicycle()
bicycle.startVehicle()
