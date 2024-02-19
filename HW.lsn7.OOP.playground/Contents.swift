import UIKit

/* Создать объект “Школа” со свойствами: массив учеников, название школы, адрес (адрес -
 новый объект с координатами x, y, street name) и директор (у директора новые поля:
 experience, рейтинг. Директор наследуется от класса Person (name:surname:age)).
 У ученика хранить имя, фамилию, номер класса, кортеж “название предмета - оценка”
 . Ученик наследуется от Person.
 У ученика сделать конструктор со всеми параметрами, добавить дефолтные значения к
 некоторым из них.
 Написать метод для ученика, выводящий информацию о студенте в формате
 “Фамилия Имя (Класс)
 предмет: оценка
 предмет: оценка”
 .
 Написать метод для школы, который выводит информацию о школе.
 Уделите особое внимание выбору, что использовать: класс или структуру, var или let, MARK +
 модификаторы доступа.*/

class Person{
 
    var name: String
    var surname: String
    var age: Int

    
    init(name: String, surname: String, age: Int) {
        self.name = name
        self.surname = surname
        self.age = age
    }
}


class Student: Person{
    var classNumber: Int
    var subjectMark: [(String, Int)]
    
    init(name: String, surname: String, age: Int, classNumber: Int = 7, subjectMark: [(String, Int)] = [("math", 10), ("science", 8)]) {
        self.classNumber = classNumber
        self.subjectMark = subjectMark
        super.init(name: name, surname: surname, age: age)
    }
    
    func studentInfo() -> String {
        return "\(name) \(surname) (\(classNumber)) \(subjectMark[0]) ; \(subjectMark[1])"
        
    }
}

let studentTest = Student.init(name: "sasha", surname: "voronik", age: 14)
print(studentTest.studentInfo())



class Director: Person{
    var expirience: Int
    var rating: Double
    
     init(name: String, surname: String, age: Int, expirience: Int, rating: Double) {
         self.expirience = expirience
         self.rating = rating
         super.init(name: name, surname: surname, age: age)
    }
}

class Adress{
    var streetName: String
    var Coordinates: [(x: Double, y: Double)]
    
    init(streetName: String, Coordinates: [(x: Double, y: Double)]) {
        self.streetName = streetName
        self.Coordinates = Coordinates
    }
}

class School {
    var student: [Student]
    var schoolName: String
    var adress: Adress
    var director: Director
    
    init(student: [Student], schoolName: String, adress: Adress, director: Director) {
        self.student = student
        self.schoolName = schoolName
        self.adress = adress
        self.director = director
    }


    func schoolInfo() -> String {
        return " School name: \(schoolName), Adress: \(adress.streetName) \(adress.Coordinates), director's name: \(director.name) \(director.surname), age: \(director.age), expirience: \(director.expirience), rating: \(director.rating), students: \((nastya.studentInfo())) ; \((ksusha.studentInfo())); \((masha.studentInfo()))"
    
    }
}

let nastya = Student.init(name: "nastya", surname: "voronik", age: 15)
let ksusha = Student.init(name: "ksusha", surname: "morozova", age: 15)
let masha = Student.init(name: "kate", surname: "pitt", age: 16)

let adresss = Adress(streetName: "Maple Street", Coordinates: [(x: 26.768768, y: 78.2698569)])
let direct = Director(name: "John", surname: "Lenon", age: 44, expirience: 15, rating: 5.0)

let testSchool = School(student: [nastya, ksusha, masha], schoolName: "Old School", adress: adresss, director: direct)

print(testSchool.schoolInfo())
