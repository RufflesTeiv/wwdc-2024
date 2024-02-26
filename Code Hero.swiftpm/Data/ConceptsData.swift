//
//  ConceptsData.swift
//
//
//  Created by Rafa (Ruffles) on 21/02/24.
//

import Foundation

class ConceptsData {
    static let concepts : [Concept] = [
        Concept(name: "Variable names", description: "", questions: [
            Question(
                name: "Select the variable name with no spaces.",
                tip: "Variable names need to be single words, having no spaces.",
                layout: .list,
                options: [
                    Option(text: "strike", correct: true),
                    Option(text: "sword strike")
                ]
            ),
            Question(
                name: "Select the variable that's written in camelCase.",
                tip: "To create variable names with multiple words in **Swift**, we use a naming convention named **camelCase**.\n\nWe start with lowercase and capitalize extra words.",
                layout: .list,
                options: [
                    Option(text: "swordStrike", correct: true),
                    Option(text: "sword-strike"),
                    Option(text: "sword strike"),
                ]
            ),
            Question(
                name: "Select the variable with the most descriptive name.",
                tip: "It’s important to make it easy to know what’s inside a variable by picking descriptive names.",
                layout: .list,
                options: [
                    Option(text: "windyVillage", correct: true),
                    Option(text: "wV"),
                ]
            ),
            Question(
                name: "Select the wrong variable name.",
                tip: "I’ll leave this one to you.",
                layout: .list,
                options: [
                    Option(text: "green slime", correct: true),
                    Option(text: "greenSlime"),
                ]
            ),
            Question(
                name: "What’s wrong with this variable name?",
                tip: "Come on, I’ve taught you that.",
                code: "let high Elf",
                layout: .list,
                options: [
                    Option(text: "It contains a space.", correct: true),
                    Option(text: "It contains a capital letter."),
                ]
            ),
            Question(
                name: "Why do we give variables descriptive names instead of {x} or {y}?",
                tip: "You can do it!",
                layout: .list,
                options: [
                    Option(text: "To help us understand what's inside them.", correct: true),
                    Option(text: "To make them faster to type."),
                    Option(text: "To make them prettier."),
                ]
            ),
            Question(
                name: "What do we use camelCase for?",
                tip: "Not telling you.",
                layout: .list,
                options: [
                    Option(text: "To create variable names with multiple words.", correct: true),
                    Option(text: "To create variables with spaces."),
                    Option(text: "To create variables that refer to camels."),
                ]
            ),
            Question(
                name: "Select the correct variable name.",
                tip: "Variable names can contain numbers too.\n\nIt’s useful when creating multiple similar variables.\n\nNumbers can never be at the start of a variable name.",
                layout: .list,
                options: [
                    Option(text: "cart1", correct: true),
                    Option(text: "1 cart"),
                    Option(text: "one cart"),
                ]
            ),
        ])
    ]
    
    static func getConceptByIdentifier(identifier : String) -> Concept? {
        let tryConcept = concepts.filter {
            $0.identifier == identifier
        }
        
        return tryConcept.first
    }
}
