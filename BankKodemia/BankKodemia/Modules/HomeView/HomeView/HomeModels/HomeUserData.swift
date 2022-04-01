
import Foundation

// MARK: - GetUserFullDataModel
struct GetUserFullData: Codable {
    let success: Bool
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let user: User
    let transactions: [Transaction]
    let balance: Double
}

// MARK: - Transaction
struct Transaction: Codable {
    let _id: String
    let amount: Double
    let type: String
    let concept: String
    let created_at: String
    let issuer: User
    let destinationUser: User?
    let isIncome: Bool
}


// MARK: - User
struct User: Codable {
    let _id, email, name, lastName: String
}


