//
//  MainAPI.swift
//  Clone-Weather
//
//  Created by 민 on 12/21/23.
//

import Foundation
import Moya

final class MainAPI {
    
    static let shared = MainAPI()
    var mainProvider = MoyaProvider<MainService>(plugins: [MoyaLoggerPlugin()])
        
    func getLocationWeather(location: String,
                            completion: @escaping (NetworkResult<Any>) -> Void) {
        mainProvider.request(.getLocationWeather(location: location)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                let networkResult = self.judgeStatus(by: statusCode, data: data, type: LocationWeather.self)
                completion(networkResult)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - JudgeStatus methods
    private func judgeStatus<T: Codable>(by statusCode: Int, data: Data, type: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<T>.self, from: data) else { return .pathErr }
        switch statusCode {
        case 200:
            return .success(decodedData)
        case 400..<500:
            return .requestErr(decodedData)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }

}
