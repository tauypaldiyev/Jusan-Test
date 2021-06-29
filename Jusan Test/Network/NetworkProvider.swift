//
//  NetworkProvider.swift
//  Jusan Test
//
//  Created by Rauan on 28.06.2021.
//

import Foundation
import Moya

public final class NetworkProvider<T: TargetType>: MoyaProvider<T> {
    
    // MARK: - Properties
    private let provider: MoyaProvider<T>
    
    // MARK: - Init
    override public init(endpointClosure: @escaping MoyaProvider<T>.EndpointClosure = MoyaProvider<T>.defaultEndpointMapping,
                         requestClosure: @escaping MoyaProvider<T>.RequestClosure = MoyaProvider<T>.defaultRequestMapping,
                         stubClosure: @escaping MoyaProvider<T>.StubClosure = MoyaProvider<T>.neverStub,
                         callbackQueue: DispatchQueue? = nil,
                         session: Session = defaultAlamofireSession(),
                         plugins: [PluginType] = [],
                         trackInflights: Bool = false) {
        self.provider = MoyaProvider(endpointClosure: endpointClosure,
                                     requestClosure: requestClosure,
                                     stubClosure: stubClosure,
                                     callbackQueue: callbackQueue,
                                     session: session,
                                     plugins: [],
                                     trackInflights: trackInflights)
    }
    
    // MARK: - Methods
    public func send(target: T, completion: @escaping (NetworkResult) -> Void) {
        print("Handle Request: \(target.baseURL)\(target.path)")
        _ = provider.request(target) { [weak self] result in
            switch result {
            case let .success(response):
                switch response.statusCode {
                case 200 ... 299, 300 ... 399:
                    self?.handleSuccess(data: response.data, completion: completion)
                default:
                    self?.handleError(data: response.data, completion: completion)
                }
            case let .failure(error):
                switch error.errorCode {
                default:
                    self?.handleServerError(completion: completion)
                }
            }
        }
    }
    
    private func handleSuccess(data: Data, completion: @escaping (NetworkResult) -> Void) {
        guard let json = dataToJson(data: data) else {
            completion(.success(JSON()))
            return
        }
        
        completion(.success(json))
    }
    
    private func handleError(data: Data, completion: @escaping (NetworkResult) -> Void) {
        print(dataToJson(data: data))
        guard let json = dataToJson(data: data),
              let error = NetworkError(json: json) else {
            completion(.failure(.serverError))
            return
        }
        
        completion(.failure(error))
    }
    
    private func handleServerError(completion: @escaping (NetworkResult) -> Void) {
        completion(.failure(.serverError))
    }
    
    private func dataToJson(data: Data) -> JSON? {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            if let json = jsonObject as? JSON {
                return json
            } else if let json = jsonObject as? [JSON] {
                return [
                    "data": json
                ]
            } else if let json = jsonObject as? [Any] {
                return [
                    "data": json
                ]
            }
            return nil
        } catch {
            return nil
        }
    }
    
}
