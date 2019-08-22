//
//  DataRequest+Map.swift
//  balaiternakRemote
//
//  Created by Ayu Ratna Wulandari on 21/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift


extension DataRequest{
    
    public func processMap<N>(mapObject:@escaping (Data)->N?) -> Observable<N>{
        
        return Observable.create{ (observer) -> Disposable in
            self.responseData(completionHandler: {(response : DataResponse<Data> ) in
                switch response.result {
                case .success:
                    #if DEBUG
                    print(String(data: response.result.value!, encoding: .utf8)!)
                    #endif
                    if let code = response.response?.statusCode, code >= 400 {
                        do {
                            let errorResponse: ApiErrorResponse = try JSONDecoder().decode(ApiErrorResponse.self, from: response.result.value!)
                            observer.onError(Constants.ApiError.dataError(response: errorResponse))
                        } catch {
                            observer.onError(Constants.ApiError.internalServerError)
                        }
                        
                    } else {
                        guard let o = mapObject(response.result.value! as Data) else {
                            observer.onError(Constants.ApiError.internalServerError)
                            return
                        }
                        observer.onNext(o)
                    }
                    
                case .failure:
                    if let code = response.response?.statusCode , code >= 400 {
                        do {
                            let errorResponse: ApiErrorResponse = try JSONDecoder().decode(ApiErrorResponse.self, from: response.result.value!)
                            observer.onError(Constants.ApiError.dataError(response: errorResponse))
                        } catch {
                            observer.onError(Constants.ApiError.internalServerError)
                        }
                    }else{
                        observer.onError(Constants.ApiError.internalServerError)
                    }
                }
            })
            return Disposables.create {
                self.cancel()
            }
        }
    }
    
    public func rx_responseArray<T:Codable>(type:T.Type) -> Observable<[T]>{
        return self.processMap(mapObject: { (data) in
             do {
                return try JSONDecoder().decode([T].self, from: data)
             } catch {
                return nil
            }
        })
    }
    
    public func rx_responseObject<T:Codable>(type:T.Type) -> Observable<T>{
        return self.processMap(mapObject: { (data) in
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                return nil
            }
        })
    }
}
