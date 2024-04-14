//
//  TimeStamp.swift
//  EFCoinCap
//
//  Created by efulgencio on 14/4/24.
//

import Foundation

extension Int {
    
    func formatearFechaDesdeTimestamp() -> String {
        let fecha = Date(timeIntervalSince1970: TimeInterval(self))
        let calendar = Calendar.current
        let year = calendar.component(.year, from: Date())
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        
        let fechaFormateada = dateFormatter.string(from: fecha)
        return fechaFormateada.replacingOccurrences(of: "\(calendar.component(.year, from: fecha))", with: "\(year)")
    }
    
}


