//
//  UserURLSession.swift
//  URLSessionSample
//
//  Created by 陳耀奇 on 2021/8/5.
//

import Foundation

class UserURLSession {
    static let shared = UserURLSession()
    
    func userPostRequest(userRequestBody:UserRequestBody,completionHandler: @escaping (UserPostResponse) -> Void) {
        
        let url = URL(string: "https://reqres.in/api/users")!
        
        // MARK: URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //MARK: POST Request V.1.0
        guard let httpBody = try? JSONEncoder().encode(userRequestBody) else {
            print("Invalid httpBody")
            return
        }
        
        // MARK: Set httpBody
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    
                    decoder.dateDecodingStrategy = .formatted(DateFormatter.customFormatter)
                    
                    let user = try decoder.decode(UserPostResponse.self, from: data)
                    
                    completionHandler(user)
                    
                }catch(let error) {
                    print(error.localizedDescription)
                }
            } else {
                print("No Data")
            }
        }.resume()
    }
    
    func userGetRequest(page: Int, completionHandler: @escaping (UserGetResponse) -> Void) {
        
        let url = URL(string: "https://reqres.in/api/users?page=\(page)")!
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    let response = try decoder.decode(UserGetResponse.self, from: data)
                    
                    completionHandler(response)
                    
                }catch(let error) {
                    print(error.localizedDescription)
                }
            } else {
                print("No Data")
            }
        }.resume()
    }
    
    func userDeleteRequest(id: Int, completionHandler: @escaping (String) -> Void) {
        
        let url = URL(string: "https://reqres.in/api/users/\(id)")!
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            var statusCode = -1
            if let httpResponse = response as? HTTPURLResponse {
                statusCode = httpResponse.statusCode
            }
            if(statusCode == 204){
                completionHandler("DELETE Success")
            }else{
                completionHandler("DELETE Fail")
            }
        }.resume()
    }
    
    func userUpdateRequest(userRequestBody:UserRequestBody,completionHandler: @escaping (UserUpdateResponse) -> Void) {
        
        let url = URL(string: "https://reqres.in/api/users/2")!
        
        // MARK: URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //MARK: POST Request V.1.0
        guard let httpBody = try? JSONEncoder().encode(userRequestBody) else {
            print("Invalid httpBody")
            return
        }
        
        // MARK: Set httpBody
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    
                    decoder.dateDecodingStrategy = .formatted(DateFormatter.customFormatter)
                    
                    let user = try decoder.decode(UserUpdateResponse.self, from: data)
                    
                    completionHandler(user)
                    
                }catch(let error) {
                    print(error.localizedDescription)
                }
            } else {
                print("No Data")
            }
        }.resume()
    }
    
}

extension DateFormatter {
    static let customFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_us_POSIX")
        return formatter
    }()
}
