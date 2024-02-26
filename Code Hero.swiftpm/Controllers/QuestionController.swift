//
//  QuestionController.swift
//
//
//  Created by Rafa (Ruffles) on 21/02/24.
//

import Foundation

public class QuestionController : ObservableObject {
    let uiController = UiController.shared
    
    var question : Question
    let randomQuestions : Bool
    
    var questionAnsweredListeners : [(Bool)->Void] = []
    
    @Published var selectedOptionIdx : Int = -1
    @Published var writtenText: String = ""
    @Published var wrongMatchCount : Int = 0
    
    init(question: Question, randomQuestions : Bool) {
        self.question = question
        self.question.options.shuffle()
        self.randomQuestions = randomQuestions
        uiController.setCurrentQuestion(question: question)
        uiController.questionAnsweredListeners.append(selectOption)
    }
    
    func selectOption(index: Int) {
        switch(question.layout) {
        case .list, .grid:
            selectedOptionIdx = index
            
            let option = question.options[index]
            option.tintColor = option.correct ? .green : .red
            
            sendSelection()
        case .match:
            tryMatch(newIndex: index)
        default: break
        }
        
    }
    
    func sendSelection() {
        switch(question.layout) {
        case .list, .grid:
            sendQuestionAnswered(success: question.options[selectedOptionIdx].correct)
        case .write:
            sendQuestionAnswered(success: question.options[0].text ==  writtenText)
        default: break
        }
    }
    
    // Private functions
    private func checkMatches() {
        var allMatched : Bool = true
        for questionOption in question.options {
            if !questionOption.matched {
                allMatched = false
            }
        }
        
        if allMatched {
            sendQuestionAnswered(success: true)
        }
    }
    
    private func optionIsLeftSide(optionIndex: Int) -> Bool {
        return optionIndex < question.options.count/2
    }
    
    private func sendQuestionAnswered(success : Bool) {
        if randomQuestions || (!randomQuestions && success) {
            for listener in questionAnsweredListeners {
                listener(success)
            }
        }
    }
    
    private func tryMatch(newIndex: Int) {
        if (selectedOptionIdx >= 0) {
            // Another option was already selected
            if (optionIsLeftSide(optionIndex: newIndex) == optionIsLeftSide(optionIndex: selectedOptionIdx)) {
                // New selected option is on the same side as last one, override selection
                selectedOptionIdx = newIndex
            }
            else {
                // Try to match
                if (newIndex == question.options[selectedOptionIdx].matchIdx) {
                    // Correct match
                    question.options[newIndex].matched = true
                    question.options[selectedOptionIdx].matched = true
                    checkMatches()
                }
                else {
                    wrongMatchCount += 1
                    if (wrongMatchCount >= 3) {
                        sendQuestionAnswered(success: false)
                    }
                }
                
                // Clear selection
                selectedOptionIdx = -1
            }
        } else if (!question.options[newIndex].matched) {
            selectedOptionIdx = newIndex
        }
    }
}
