import UIKit

@propertyWrapper struct Capitalized {
    var wrappedValue: String {
        didSet{
            wrappedValue = wrappedValue.capitalized
        }
    }
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
    }
}

enum Faculty: String, CaseIterable {
    case Arts, Chemistry, BioTechnology, Law, Architecture, Physics
}

enum Subject: String, CaseIterable {
    case Calculus, Philosophy, Macroeconomics, Sociology, law
}

class University {
    @Capitalized var name: String
    var founded: String
    var studentList: [Student]
    var listOfLecturers: [Lecturer]
    var facultyList: [Faculty]
    init(name: String, founded: String, studentList: [Student], listOfLecturers: [Lecturer], facultyList: [Faculty]) {
        self.name = name
        self.founded = founded
        self.studentList = studentList
        self.listOfLecturers = listOfLecturers
        self.facultyList = facultyList
    }
}

class Student {
    @Capitalized var  name: String
    var idNumber: Int
    var faculty: Faculty
    var enrolmentYear: Int
    var academicRecords: [Grade]
    var GPA: Double {
        let finalGradesArray = academicRecords.map({$0.finalGrade})
       return finalGradesArray.reduce(0, +) / Double(finalGradesArray.count)
    }
    
    
    init(name: String, idNumber: Int, faculty: Faculty, enrolmentYear: Int, academicRecords: [Grade]) {
        self.name = name
        self.idNumber = idNumber
        self.faculty = faculty
        self.enrolmentYear = enrolmentYear
        self.academicRecords = academicRecords
    }

    
    struct Grade {
        var subject: Subject
        var activityScore: Double
        var midtermScore: Double
        var finalExamScore: Double
         // final score
        var finalGrade: Double {
                activityScore + midtermScore + finalExamScore
        }
    }
    
    // 1
    func yearsOfStudying(AsOf currentYear: Int) {
        print("\(name) has been studying for \(currentYear - enrolmentYear) year(s)")
    }
    // 2
    func studentName() -> (firstName: String, lastName: String) {
        let fullNameArray = name.components(separatedBy: " ")
        if fullNameArray.count == 2 {
            return (firstName: fullNameArray[0],
             lastName: fullNameArray[1])
        } else {
            return (firstName: fullNameArray[0],
             lastName: "")
        }
    }
    // 3
    func birthDate() -> String {
        return "\(name) was born in \(enrolmentYear - 18)."
    }
    // 4
    func over89Grade() -> String {
        let highScore = academicRecords.filter({$0.finalGrade > 89}).map({$0.subject})
        return "\(name) scored more than 89 in the following subjects: \(highScore.map({$0.rawValue}))"
        
    }
    // 5
    func failedIn() -> String {
        let failed = academicRecords.filter({$0.finalGrade < 51}).map({$0.subject})
        return "\(name) failed in the following subjects: \(failed.map({$0.rawValue}))"
    }
    // 6
    func finalExamScoreOver20() -> String  {
        let failed = academicRecords.filter({$0.finalGrade < 51 && $0.finalExamScore > 20}).map({$0.subject})
        return "\(name) failed in the following subjects: \(failed.map({$0.rawValue})) (even though their final exam score of the listed subjects was greater than 20."
    }
     // 7
    func mostActive() -> String? {
        let mostActiveIn = academicRecords.max(by: {$0.activityScore < $1.activityScore})
        return  mostActiveIn?.subject.rawValue
    }
    
    
}
class Lecturer {
    @Capitalized var name: String
    var idNumber: Int
    var faculty: Faculty
    var subject: [Subject]
    var timeTable: TimeTable
    
    init(name: String, idNumber: Int, faculty: Faculty, subject: [Subject], timeTable: TimeTable) {
        self.name = name
        self.idNumber = idNumber
        self.faculty = faculty
        self.subject = subject
        self.timeTable = timeTable
    }
}

struct TimeTable {
    let Monday: DayOfWeek?
    let Tuesday: DayOfWeek?
    let Wednesday: DayOfWeek?
    let Thursday: DayOfWeek?
    let Friday: DayOfWeek?
    let Saturday: DayOfWeek?
    
    struct DayOfWeek {
        let lecturesToBeHeld: [LectureToBeHeld]
        
        struct LectureToBeHeld {
            let subject: Subject
            let faculty: Faculty
            let startTime: String
            let finishTime: String
            let auditoriumNumber: Int
        }
        
    }
}

var elene = Student(name: "elene kapanadze", idNumber: 54001056734, faculty: .Architecture, enrolmentYear: 2018, academicRecords: [.init(subject: .Calculus, activityScore: 2.5, midtermScore: 12.7, finalExamScore: 32.8), .init(subject: .Macroeconomics, activityScore: 23, midtermScore: 2.7, finalExamScore: 22.8)])
elene.yearsOfStudying(AsOf: 2026)
elene.studentName()
elene.birthDate()
print(elene.failedIn())
print(elene.finalExamScoreOver20())
print(elene.birthDate())
print(elene.studentName())
print("eleniko used to be most active at \(elene.mostActive()!)")

