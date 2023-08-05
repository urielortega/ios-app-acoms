//
//  Acom.swift
//  AppACOMs
//
//  Created by Uriel Ortega on 31/07/23.
//

import SwiftUI

struct Acom: Identifiable, Codable, Equatable {
    static func == (lhs: Acom, rhs: Acom) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id: Int
    let name: String
    let description: String
    let creditAmount: Double
    let creditLimit: Double
    let subtypes: [AcomSubtype]
    let image: String
}

struct AcomSubtype: Identifiable, Codable {
    let id: Int
    let name: String
    let creditAmount: Double
    let creditLimit: Double
}

// Definición de objetos Acom
var acom1 = Acom(
    id: 1,
    name: "ACOM 1",
    description: "Tutorías",
    creditAmount: 0.0,
    creditLimit: 2.0,
    subtypes: [acomSubtype1, acomSubtype2],
    image: "acom_1"
)

var acom2 = Acom(
    id: 2,
    name: "ACOM 2",
    description: "Proyectos de investigación",
    creditAmount: 0.0,
    creditLimit: 2.0,
    subtypes: [acomSubtype3, acomSubtype4, acomSubtype5, acomSubtype6],
    image: "acom_2"
)

var acom3 = Acom(
    id: 3,
    name: "ACOM 3",
    description: "Eventos académicos relacionados con la carrera",
    creditAmount: 0.0,
    creditLimit: 2.0,
    subtypes: [acomSubtype7, acomSubtype8, acomSubtype9, acomSubtype10, acomSubtype11],
    image: "acom_3"
)

var acom4 = Acom(
    id: 4,
    name: "ACOM 4",
    description: "Actividades extraescolares",
    creditAmount: 0.0,
    creditLimit: 1.0,
    subtypes: [acomSubtype12, acomSubtype13],
    image: "acom_4"
)

var acom5 = Acom(
    id: 5,
    name: "ACOM 5",
    description: "Construcción de prototipos y desarrollo tecnológico",
    creditAmount: 0.0,
    creditLimit: 2.0,
    subtypes: [acomSubtype14, acomSubtype15, acomSubtype16, acomSubtype17],
    image: "acom_5"
)

var acom6 = Acom(
    id: 6,
    name: "ACOM 6",
    description: "Participación en ediciones",
    creditAmount: 0.0,
    creditLimit: 1.0,
    subtypes: [acomSubtype18, acomSubtype19, acomSubtype20],
    image: "acom_6"
)

var acom7 = Acom(
    id: 7,
    name: "ACOM 7",
    description: "Programas de apoyo a la formación profesional",
    creditAmount: 0.0,
    creditLimit: 2.0,
    subtypes: [acomSubtype21, acomSubtype22, acomSubtype23, acomSubtype24, acomSubtype25, acomSubtype26],
    image: "acom_7"
)

// Definición de subtipos de ACOM oficiales.
var acomSubtype1 = AcomSubtype(
    id: 1,
    name: "Semestre 1",
    creditAmount: 0.0,
    creditLimit: 1.0
)

var acomSubtype2 = AcomSubtype(
    id: 2,
    name: "Semestre 2",
    creditAmount: 0.0,
    creditLimit: 1.0
)

var acomSubtype3 = AcomSubtype(
    id: 3,
    name: "Verano científico o estancias en centros de Investigación",
    creditAmount: 0.0,
    creditLimit: 2.0
)

var acomSubtype4 = AcomSubtype(
    id: 4,
    name: "Colaborador en el desarrollo de proyectos de Investigación",
    creditAmount: 0.0,
    creditLimit: 2.0
)

var acomSubtype5 = AcomSubtype(
    id: 5,
    name: "Ponencias en simposios, foros, congresos, etc. de divulgación de la ciencia y la tecnología",
    creditAmount: 0.0,
    creditLimit: 1.0
)

var acomSubtype6 = AcomSubtype(
    id: 6,
    name: "Entrevista en programas de radio y /o televisión para la difusión de la ciencia y la tecnología",
    creditAmount: 0.0,
    creditLimit: 0.5
)

var acomSubtype7 = AcomSubtype(
    id: 7,
    name: "Evento académico fase local",
    creditAmount: 0.0,
    creditLimit: 1.0
)

var acomSubtype8 = AcomSubtype(
    id: 8,
    name: "Evento académico fase regional",
    creditAmount: 0.0,
    creditLimit: 1.0
)

var acomSubtype9 = AcomSubtype(
    id: 9,
    name: "Evento académico fase nacional",
    creditAmount: 0.0,
    creditLimit: 2.0
)

var acomSubtype10 = AcomSubtype(
    id: 10,
    name: "Colaboradores en eventos académicos organizados por el Instituto",
    creditAmount: 0.0,
    creditLimit: 1.0
)

var acomSubtype11 = AcomSubtype(
    id: 11,
    name: "Asistencia a congresos académicos nacionales/internacionales, concursos",
    creditAmount: 0.0,
    creditLimit: 1.0
)

var acomSubtype12 = AcomSubtype(
    id: 12,
    name: "Semestre 1",
    creditAmount: 0.0,
    creditLimit: 0.5
)

var acomSubtype13 = AcomSubtype(
    id: 13,
    name: "Semestre 2",
    creditAmount: 0.0,
    creditLimit: 0.5
)

var acomSubtype14 = AcomSubtype(
    id: 14,
    name: "Concurso de Innovación Tecnológica Fase local",
    creditAmount: 0.0,
    creditLimit: 1.0
)

var acomSubtype15 = AcomSubtype(
    id: 15,
    name: "Concurso de Innovación Tecnológica Fase regional",
    creditAmount: 0.0,
    creditLimit: 1.0
)

var acomSubtype16 = AcomSubtype(
    id: 16,
    name: "Concurso de Innovación Tecnológica Fase nacional",
    creditAmount: 0.0,
    creditLimit: 2.0
)

var acomSubtype17 = AcomSubtype(
    id: 17,
    name: "Diseño y construcción de prototipos didácticos",
    creditAmount: 0.0,
    creditLimit: 1.0
)

var acomSubtype18 = AcomSubtype(
    id: 18,
    name: "Revista científica indexada",
    creditAmount: 0.0,
    creditLimit: 1.0
)

var acomSubtype19 = AcomSubtype(
    id: 19,
    name: "Revista científica del instituto",
    creditAmount: 0.0,
    creditLimit: 1.0
)

var acomSubtype20 = AcomSubtype(
    id: 20,
    name: "Memoria de congreso",
    creditAmount: 0.0,
    creditLimit: 1.0
)

var acomSubtype21 = AcomSubtype(
    id: 21,
    name: "Cursos/talleres de formación profesional (2 cursos MOOC'S)",
    creditAmount: 0.0,
    creditLimit: 1.0
)

var acomSubtype22 = AcomSubtype(
    id: 22,
    name: "Diplomados y certificaciones",
    creditAmount: 0.0,
    creditLimit: 2.0
)

var acomSubtype23 = AcomSubtype(
    id: 23,
    name: "Taller de fomento a la lectura",
    creditAmount: 0.0,
    creditLimit: 1.0
)

var acomSubtype24 = AcomSubtype(
    id: 24,
    name: "Participación en brigadas institucionales para la conservación del medio ambiente",
    creditAmount: 0.0,
    creditLimit: 1.0
)

var acomSubtype25 = AcomSubtype(
    id: 25,
    name: "Participación en jornadas de la salud ó 4 pláticas sobre salud física y mental",
    creditAmount: 0.0,
    creditLimit: 1.0
)

var acomSubtype26 = AcomSubtype(
    id: 26,
    name: "Instructor en programas de apoyo a la formación académica (Asesoría alumno-alumno)",
    creditAmount: 0.0,
    creditLimit: 2.0
)
