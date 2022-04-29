//
//  DeleteStudentScene.swift
//  DZIntranet
//
//  Created by Kenyi Rodriguez on 21/04/22.
//

import Foundation

class DeleteStudentScene: Scene {
    
    var inputs = DeleteStudentSceneInputs()
    
    override func drawView() {
        super.drawView()
        self.getSearchStudent()
    }
    
    private func getSearchStudent() {
        let foundedStudent = getStudent()
        
        let answerValue = self.inputs.txtConfirm.getInput()
        let answer = DeleteAnswerOption(rawValue: Int(answerValue) ?? 0) ?? .no
        
        self.deleteDecision(student: foundedStudent, option: answer)
        self.backScene()
    }
    
    private func getStudent() -> Student {
        let searchKey = self.inputs.txtSearch.getInput()
        guard let student = Students.shared.searchByKey(searchKey) else {
            print("\nNo se encontraron resultado para: \(searchKey), intente de nuevo")
            _ = readLine()
            return getStudent()
        }
        
        print("\nAlumno encontrado:")
        Students.shared.showStudent(student)
        
        return student
    }
    
    private func deleteDecision(student: Student, option: DeleteAnswerOption) {
        switch option {
            case .yes: Students.shared.delete(student)
            case .no: print("\n¡No se eliminó al estudiante!")
        }
    }
}
