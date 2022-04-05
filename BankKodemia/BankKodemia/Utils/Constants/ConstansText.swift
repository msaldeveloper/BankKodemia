//
//  TextLocals.swift
//  Bankodemia
//
//  Created by Mario Saldana on 16/03/22.
//

import Foundation
import CoreText

struct TextLocals{
    // MARK: generic texts
    static let continue_button_message: String = "Continuar"
    static let agree_button_message: String = "Aceptar"
    
    // MARK: init session and welcome screen
    static let init_session_button_message: String = "Iniciar Sesión"
    static let init_session_create_account_button_message: String = "Crear Cuenta"
    static let init_session_back_message: String = "PRINCIPAL"
    static let init_session_top_message : String = "Iniciar Sesion"
    static let init_session_description_message: String = "Escribe el correo y teléfono con el que te registraste, a través de estos te enviaremos el acceso"
    static let init_session_top_email_input_message: String = "Escribe tu correo"
    static let init_session_email_input_message: String = "correo@gmail.com"
    static let init_session_top_password_input_message: String = "Escribe tu contraseña"
    static let init_session_password_input_message: String = "********"
    static let init_session_help_message: String = "¿Necesitas ayuda? Escríbenos a "
    static let init_session_help_link: String = "bankodemia@com.mx"
    static let init_session_welcome_message_top: String = "¡Adiós a las complicaciones!"
    static let init_session_welcome_message_bottom: String = "Usa el dinero a TU manera"
    
    // MARK: create account screens
//    static let create_account_top_message: String = "ESCRIBE TU CORREO"
//    static let create_account_description_message: String = "Aquí recibirás comprobantes de tus movimientos e información sobre tu cuenta"
//    static let create_account_notice_of_privacy_message: String = "Al tocar continuar aceptas nuestro"
//    static let create_account_notice_of_privacy_bold_message: String = "Aviso de privacidad"
//    static let create_account_data_input_top_message: String = "Escríbelos tal como aparecen en tu identificación oficial sin abreviaturas"
//    static let create_account_data_input_name_message: String = "Nombre(s)"
//    static let create_account_data_input_lastname_message: String = "Apellido(s)"
//    static let create_account_data_input_ocupation_message: String = "Ocupación"
//    static let create_account_data_input_date_of_birth: String = "Fecha de nacimiento"
    static let create_account_data_input_bottom_message: String = "Esta información es necesaria para verificar tu identidad."
    static let create_account_data_input_bottom_bold_message: String = "Nunca la usaremos sin tu consentimiento."
    static let create_account_data_input_modal_top_message: String = "Ingresa tu fecha de nacimiento"

    static let create_account_data_input_phone_top_message: String = "ESCRIBE TU TELÉFONO"

    
    
        
    // MARK: home and tab bar screens
    
    static let home_available_cash_top_message: String = "DINERO DESPONIBLE"
    static let home_transaction_detail: String = "DETALLE DE TRANSACCIÓN"
    static let home_send_button: String = "Enviar"
    static let home_receive_button: String = "Recibir"
    static let home_date_message: String = "FECHA Y HORA"
    static let home_id_transaction_message : String = "ID DE TRANSACCIÓN"
    static let home_concept_message: String = "CONCEPTO"
    static let home_issuing_account: String = "CUENTA EMISORA"
    static let home_number_of_account_message = "Número de Cuenta"
    
    static let home_card_top_message: String = "TARJETA"
    static let home_card_number_of_card_message: String = "No. de Tarjeta"
    static let home_card_validity_message: String = "Vigencia"
    static let home_card_cvv_message: String = "CVV"
    
    static let home_services_top_message: String = "SERVICIOS"
    static let home_services_recharge_cell: String = "Recarga de celular"
    static let home_services_cell_companies: String = "AT&T, Telcel, Movistar"
    static let home_services_mobile_plan_message: String = "Recarga de celular"
    static let home_services_internet_tv_phone_message: String = "Internet/TV/Teléfono"
    static let home_services_gas_message: String = "Gas"
    static let home_services_credit_cards_message: String = "Tarjetas de crédito"
    static let home_services_bank_companies_message: String = "BBVA, Santander, Banorte, Banamex"
    static let home_services_shop_payment_message: String = "Tiendas departamentales"
    static let home_services_shop_companies_message: String = "Liverpool, Sears, Palacio de Hierro"
    
    static let tab_bar_init : String = "INICIO"
    static let tab_bar_card : String = "TARJETA"
    static let tab_bar_services : String = "SERVICIOS"
    
    // MARK: send cash screen
    
    static let send_cash_top_message: String = "ENVIAR DINERO"
    static let send_cash_transfer_message: String = "TRANSFERENCIA"
    static let send_cash_sent_to: String = "ENVIAR A"
    static let send_cash_quantity_message: String = "CANTIDAD"
    static let send_cash_payment_concept_message: String = "CONCEPTO DE PAGO"
    static let send_cash_spei_message: String = "SPEI sin costo"
    static let send_cash_transfer_button: String = "Hacer Transferencia"
    static let send_cash_confirm_modal_top_message: String = "CONFIRMACIÓN DE TRANSFERENCIA"
    static let send_cash_confirm_modal_message: String = "¿Estás segura(o) que quieres realizar esta transacción?"
    static let send_cash_confirm_moddal_button_message: String = "Aceptar"
    
    static let send_cash_spinner_message: String = "Espera un momento, estamos procesando tu transacción"
    static let send_cash_successful_screen_message: String = "Tu transacción ha sido finalizada"
    static let send_cash_successful_screen_button: String = "Volver a Inicio"
    
}

struct Text{
    struct CreateAccount{
        
        struct EmailRegister {
            
            static let TopMessage: String = "ESCRIBE TU CORREO"
            static let DescriptionMessage: String = "Aquí recibirás comprobantes de tus movimientos e información sobre tu cuenta"
            static let LabelMessage: String = "Escribe tu correo"
            static let InputMessage: String = "correo@gmail.com"
            static let PrivacyMessage: String = "Al tocar continuar aceptas nuestro"
            static let PrivacyBoldMessage: String = "Aviso de privacidad"
        }
        
        struct Detail {
            static let TopMessage: String = "Escríbelos tal como aparecen en tu identificación oficial sin abreviaturas"
            static let NameMessage: String = "Nombre(s)"
            static let LastNameMessage: String = "Apellido(s)"
            static let OcupationMessage: String = "Ocupación"
            static let Date: String = "Fecha de nacimiento"
        }
        
        struct PhoneVerification {
            static let TopMessage: String = "ESCRIBE TU TELÉFONO"
            static let ButtonBoldMessage: String = "Lo usarás para iniciar sesión"
            static let LabelNumberMessage: String = "Tu número de celular"
            static let BottonMessage: String = "para protejer tu cuenta, te enviaremos un código vía SMS"
        }
        
        struct IdentityVerification {
            static let TopMessage: String = "Ahora, vamos a verificar tu identidad para proteger tu cuenta."
            static let BottonMessage: String = "Deberás subir una fotografía de tu INE o pasaporte vigente y tomarte una selfie. Si eres extranjero necesitarás una fotografía de tu documento migratorio (FM3)"
        }
        
        struct Uploading {
            static let TopMessage: String = "Dale permiso a Bankodemia para utilizar la cámara. Asegúrate de tener buena luz y enfocar bien tu documento de frente."
            static let BottonMessage: String = "Subir Información"
            static let BottonUploadMessage: String = "Arrastra tu archivo aquí o subelo desde tu ORDENADOR"
        }
        
        struct IdSelect {
            static let Ine: String = "INE"
            static let ImmigrantDoc: String = "Documento Migratorio"
            static let Passport: String = "Pasaporte"
            static let TopMessage: String = "Seleccionado el tipo de documento que deseas fotografiar"
            static let BottomMessage: String = "Conoce cómo protegemos tus documentos"
        }
        
        struct CreatePassword {
            static let TopMessage: String = "Crea una contraseña segura"
            static let MediumMessage: String = "La usarás para entrar a la app y confirmar tus transacciones."
            static let BottomMessage: String = "Usa al menos 6 caracteres alfanuméricos, no consecutivos ni repetidos."
            static let CreateLabel: String = "Contraseña"
            static let ConfirmLabel: String = "Confirma tu contraseña"
            static let ButtonCreateMessage: String = "Crear Contraseña"
            
        }
        
        struct Loading {
            static let TransactionMessage: String = "Espera un momento, estamos procesando tu transacción"
            static let UpdatingMessage: String = "Espera un momento, estamos enviando tus datos"
            
        }
        
        struct Success {
            static let ConfirmationMessage: String = "¡Listo! Recibimos tu información. Usualmente tardamos unos minutos en verificar, pero en caso de tener algún problema, nos comunicaremos contigo."
            static let ThakYouMessage: String = "¡GRACIAS POR USAR BANKODEMIA!"
            static let FinishMessage: String = "Volver al Inicio"
        }
        
    }
    struct AddNewRecipient {
        static let BackButton: String = "ENVIAR DINERO"
        static let PageTitle:String = "AGREGAR CONTACTO"
        static let ClabeLabel: String = "CLABE"
        static let CardLabel: String = "TARJETA"
        static let DigitsLabel: String = "18 dígitos"
        static let CardNumberLabel: String = "No. de tarjeta"
        static let InstitutionLabel: String = "Institución"
        static let NameLabel: String = "Nombre"
        static let EmailLabel: String = "Correo de notificación"
        static let AddRecipientButton: String = "Agregar Contacto"
        static let BackToInitButton: String = "Volver a Inicio"
        static let ImageBottomLabel: String = "Tu contacto fue agregado con éxito"
        
        
    }
    struct Routes {
        static let urlBase: String = "https://bankodemia.kodemia.mx"
        static let getUserFullProfile = "/users/me/profile"
        static let listUsers = "/users"
        static let transactions = "/transactions"
    }
}



