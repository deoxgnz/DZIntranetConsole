//
//  StudentsDataSource.swift
//  DZIntranet
//
//  Created by Kenyi Rodriguez on 19/04/22.
//

import Foundation

protocol StudentsDataSourceProtocol {
    
    static var shared: StudentsDataSourceProtocol { get set }
    
    func insert(_ student: Student)
    func showStudent(_ student: Student)
    func delete(_ student: Student)
    func getAll() -> [Student]
    func getAllSortedByFullName() -> [Student]
    func searchByKey(_ searchKey: String) -> Student?
}

class Students: StudentsDataSourceProtocol {
    
    static var shared: StudentsDataSourceProtocol = Students()
    
    private var data = [
        Student(name: "Kenyi", lastName: "Rodriguez", address: "Calle sin fin 666", document: Student.Document(type: .dni, number: "87654321")),
        Student(name: "Fernando", lastName: "Mateo", address: "Calle los olvidados", document: Student.Document(type: .dni, number: "67854321")),
        Student(name: "Daniel", lastName: "Garcia", address: "Calle los charros", document: Student.Document(type: .ce, number: "4567890123"))
    ]
    
    func insert(_ student: Student) {
        self.data.append(student)
    }
    
    func delete(_ student: Student) {
        guard let index = self.data.firstIndex(where: { $0.document.number == student.document.number}) else {
            print("\n¡¡¡Error al eliminar al alumno!!!\n")
            return
        }
        self.data.remove(at: index)
        print("\n¡Alumno eliminado!\n")
    }
    
    func showStudent(_ student: Student){
        
        let content = """
        
        Nombre: \(student.name)
        Apellido: \(student.lastName)
        Dirección: \(student.address)
        \(student.document.type.information.name): \(student.document.number)
        
        """
        
        print(content)
    }
    
    func getAll() -> [Student] {
        self.data
    }
    
    func getAllSortedByFullName() -> [Student] {
        self.data.sorted(by: { $0.fullName < $1.fullName })
    }
    
    func searchByKey(_ searchKey: String) -> Student? {
        return self.data.first { student in
            
            let textToSearch = searchKey.lowercased()
            let fullName = student.fullName.lowercased()
            let document = student.document.number.lowercased()
            
            return document.contains(textToSearch) || fullName.contains(textToSearch)
        }
    }
    
//    mutating func getAllSortedByFullName() -> [Student] {
//        return self.data.sorted { studentA, studentB in
//            return studentA.fullName < studentB.fullName
//        }
//    }
}
