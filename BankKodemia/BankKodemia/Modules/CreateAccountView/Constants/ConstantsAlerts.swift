//
//  ConstantsAlerts.swift
//  BankKodemia
//
//  Created by MacBook on 03/04/22.
//

import Foundation
import CoreText

struct TextAlerts{
    // MARK: Succes
    static let SuccesValidation: String = "Validación Exitosa"
    // MARK: EmailAccountValidator
    static let EmailEmpty: String = "Ingrese un correo electrónico"
    static let InvalidEmail: String = "Ingresa un correo valido"
    // MARK: CreateAccountValidator
    static let AllTextFieldsEmpty: String = "Llena correctamente todos los campos requeridos"
    static let TextFirstNameEmpty: String = "Ingrese su nombre"
    static let TextLastNameEmpty: String = "Ingrese su apellido"
    static let TextOccupationEmpty: String = "Ingrese su ocupación"
    static let TextDateEmpty: String = "Ingrese su fecha de nacimiento"
    // MARK: PhoneAccountValidator
    static let TextPhoneEmpty: String = "Ingrese su teléfono"
    static let InvalidPhone: String = "Tu número celular debe contener 10 dígitos"
    // MARK: IdAccountValidator
    static let TextIdEmpty: String = "Envíe una foto de una identificacion"
    // MARK: PasswordAccountValidator
    static let AllPasswordFieldsEmpty: String = "Llena correctamente todos los campos requeridos"
    static let TextPasswordEmpty: String = "Ingrese una contraseña"
    static let TextConfirmPasswordEmpty: String = "La contraseña no coincide"
    static let TextFailPassword: String = "La contraseña debe de tener una mayuscula, un numero y un signo"
    static let TextWrongPassword: String = "Las contraseñas NO coinciden"
}
