//  DeleteStudentSceneInputs.swift
//  DZIntranet
//  Created by Daniel Garcia on 29/04/22.

import Foundation

struct DeleteStudentSceneInputs {
    
    lazy var txtSearch: Input.Text = {
        
        let message = """
                        
        Ingrese el número de documento por cual desea eliminar al alumno:
        
        """
        
        return Input.Text(message: message,
                   errorMessage: "El dato de búsqueda es incorrecto",
                   minLength: 3)
    }()
    
    lazy var txtConfirm: Input.Integer = {
        let message = """
        
        ¿Está seguro de eliminar al alumno?:
        
        (1) - Si
        (2) - No
        
        """
        
        let errorMessage = "Opción no válida"
        
        return Input.Integer(message: message,
                             errorMessage: errorMessage,
                             range: 1...2)
    }()
}
