//
//  EndPointGrupo.swift
//  EFCoinCap
//
//  Created by efulgencio on 13/4/24.
//

import Foundation

enum EndPoinAsset {
    case assets
    case assetsId
    case assetHistory
    case assetMarket
    
    func stringValue() -> String {
          switch self {
          case .assets:
              return "assets"
          case .assetsId:
              return "assets/id"
          case .assetHistory:
              return "assets/id/history?interval=d1"
          case .assetMarket:
              return "assets/id/markets"
          }
    }
}

enum EndPoinRate{
    case rates
    case ratesId
    
    func stringValue() -> String {
          switch self {
          case .rates:
              return "rates"
          case .ratesId:
              return "rates/id"
          }
    }
}

enum EndPointExchange {
    case exchanges
    case exchangesId
    
    func stringValue() -> String {
          switch self {
          case .exchanges:
              return "exchangesId"
          case .exchangesId:
              return "exchangesId/id"
          }
    }
}

enum EndPointGrupo {
    case enumAsset(EndPoinAsset)
    case enumRate(EndPoinRate)
    case enumExchange(EndPointExchange)
}

extension EndPointGrupo: EndPointProtocol {
    
    private var baseURL: String {
        return ConfigurationNet.shared.data.baseUrl
    }
    
    private var relativeURL: String {
        switch self {
        case .enumAsset(let valor):
            return valor.stringValue()
        case .enumRate(let valor):
            return valor.stringValue()
        case .enumExchange(let valor):
            return valor.stringValue()
        }
    }
    
    var urlString: String {
        return "\(baseURL)\(relativeURL)"
    }
    
    var headers: [String : String] {
        var headers: [String: String] = [:]
        headers["Accept"] = "application/json"
        headers["Accept-Language"] = "es"
        return headers
    }
    
    var method: String {
        switch self {
            case .enumAsset( _):
                return URLRequestMethod.get.rawValue
            case .enumRate( _):
                return URLRequestMethod.get.rawValue
            case .enumExchange( _):
                return URLRequestMethod.get.rawValue
        }
    }
    
    var parameters: [String : Any] {
        var params: [String: Any] = [:]
        switch self {
            case .enumRate( _):
                params = ["page": 1]
            default:
                break
        }
        
        return params
    }
    
}
