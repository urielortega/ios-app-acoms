//
//  Enums.swift
//  AppACOMs
//
//  Created by Uriel Ortega on 04/08/23.
//

import Foundation

enum FilterType: String, CaseIterable, Identifiable {
    case none,
         acom1, acom2, acom3, acom4, acom5, acom6, acom7,
         department1, department2, department3
    
    var id: Self { self }
    
    var name: String {
        switch self {
        case .none: return "Sin filtro"
        case .acom1: return "ACOM 1"
        case .acom2: return "ACOM 2"
        case .acom3: return "ACOM 3"
        case .acom4: return "ACOM 4"
        case .acom5: return "ACOM 5"
        case .acom6: return "ACOM 6"
        case .acom7: return "ACOM 7"
        case .department1: return "Departamento 1"
        case .department2: return "Departamento 2"
        case .department3: return "Departamento 3"
        }
    }
}

enum SortType: String, CaseIterable, Identifiable {
    case nameFromAToZ, nameFromZToA,
         fromLatestToOldest, fromOldestToLatest,
         defaultOrder

    var id: Self { self }
    
    var name: String {
        switch self {
        case .nameFromAToZ: return "Ordenar por nombre (A-Z)"
        case .nameFromZToA: return "Ordenar por nombre (Z-A)"
        case .fromLatestToOldest: return "Ordenar de la más próxima a la más lejana"
        case .fromOldestToLatest: return "Ordenar de la más lejana a la más próxima"
        case .defaultOrder: return "Orden por defecto"
        }
    }
}

enum SearchType: String, CaseIterable, Identifiable {
    case name, code

    var id: Self { self }
    
    var name: String {
        switch self {
        case .name: return "Por nombre"
        case .code: return "Por código"
        }
    }
}
