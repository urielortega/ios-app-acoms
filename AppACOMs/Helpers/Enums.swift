//
//  Enums.swift
//  AppACOMs
//
//  Created by Uriel Ortega on 04/08/23.
//

import Foundation

enum FilterType: String, CaseIterable, Identifiable {
    case none = "Sin filtro"
    case acom1 = "ACOM 1"
    case acom2 = "ACOM 2"
    case acom3 = "ACOM 3"
    case acom4 = "ACOM 4"
    case acom5 = "ACOM 5"
    case acom6 = "ACOM 6"
    case acom7 = "ACOM 7"
    case department1 = "Departamento 1"
    case department2 = "Departamento 2"
    case department3 = "Departamento 3"
    
    var id: Self { self }
}

enum SortType: String, CaseIterable, Identifiable {
    case nameFromAToZ = "Ordenar por nombre (A-Z)"
    case nameFromZToA = "Ordenar por nombre (Z-A)"
    case fromLatestToOldest = "Ordenar de la más próxima a la más lejana"
    case fromOldestToLatest = "Ordenar de la más lejana a la más próxima"
    case defaultOrder = "Orden por defecto"

    var id: Self { self }
}

enum SearchType: String, CaseIterable, Identifiable {
    case name = "Por nombre"
    case code = "Por código"

    var id: Self { self }
}
