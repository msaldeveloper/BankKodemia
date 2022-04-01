//  HomeDataManager.swift
//  BankKodemia
//
//  Created by Mario Saldana on 29/03/22.

import Foundation
import Alamofire
import Combine
let urlGetUserFullProfile = Text.Routes.urlBase+Text.Routes.getUserFullProfile

class GetUserRequest {
    
//    func tokenReciver(token : String){
//        let headers: HTTPHeaders = [
//            "Authorization" : "Bearer "+token,
//            "Accept": "application/json"
//        ]
//        getUserProfile(headers)
//    }
    //DataResponsePublisher<GetUserFullData>
    func getUserProfile(_ token : HTTPHeaders )->DataResponsePublisher<GetUserFullData>{
        print("this token ",urlGetUserFullProfile,token)
        return AF
            .request(urlGetUserFullProfile, method: .get, headers: token)
            .response { fullData in
                debugPrint(fullData)
                
            }
            .validate()
            .publishDecodable(type: GetUserFullData.self)

    }
}
//        let fullProfile = AF
//            .request(urlGetUserFullProfile, headers: token)
//            .response { response in
//            debugPrint(response)
//            }.validate()
//            .publishDecodable(type: GetUserFullData.self, decoder: JSONDecoder.self as! DataDecoder)
//        //.publishDecodable(type: GetUserFullData.self)
//        return fullProfile


//let decoder = JSONDecoder()
//              do {
//                  let decodedData = try decoder.decode(GetUserFullData.self, from: fullData.data!)
//                  //print("success",decodedData.data.balance)//imprime el balance
//                  //print("success",decodedData.data.transactions[0].amount)
//                  //print("success",decodedData.data.transactions[0]._id)
//                  print("success",decodedData.data.transactions[2].created_at)
//
//              } catch {
//                  print("an error -->",
//                        error)
//                  //return nil
//              }
