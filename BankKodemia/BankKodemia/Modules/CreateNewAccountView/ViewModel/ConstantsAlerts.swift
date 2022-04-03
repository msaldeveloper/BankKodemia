//
//  ConstantsAlerts.swift
//  BankKodemia
//
//  Created by MacBook on 03/04/22.
//

import Foundation
import CoreText

struct TextAlerts{
    // MARK: EmailAccountValidator
    static let EmailEmpty: String = "Ingrese un correo electrónico"
    // MARK: CreateAccountValidator
    static let AllTextFieldsEmpty: String = "Llena correctamente todos los campos requeridos"
    static let TextFirstNameEmpty: String = "Ingrese su nombre"
    static let TextLastNameEmpty: String = "Ingrese su apellido"
    static let TextOccupationEmpty: String = "Ingrese su ocupación"
    static let TextDateEmpty: String = "Ingrese su fecha de nacimiento"
    // MARK: PhoneAccountValidator
    static let TextPhoneEmpty: String = "Ingrese su teléfono"
    // MARK: IdAccountValidator
    static let TextIdEmpty: String = "Envíe una foto de una identificacion"
    // MARK: PasswordAccountValidator
    static let AllPasswordFieldsEmpty: String = "Llena correctamente todos los campos requeridos"
    static let TextPasswordEmpty: String = "Ingrese una contraseña"
    static let TextConfirmPasswordEmpty: String = "La contraseña no coincide"
}
