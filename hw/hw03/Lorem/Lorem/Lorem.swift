//
//  Lorem.swift
//  Lorem
//
//  Created by Natasha Carlton on 2/14/23.
//  nancarl@iu.edu
//

import Foundation

class Lorem {
    let joyWords: [String] = ["happy", "happiness", "joy", "yay", "yeah"]
    let disgustWords: [String] = ["gross", "disgusting", "ew", "no", "revolting"]
    let fearWords: [String] = ["scared", "fearful", "afraid", "nervous", "not sure"]
    let angerWords: [String] = ["mad", "angry", "anger", "steaming", "furious"]
    let sadnessWords: [String] = ["sad", "depressed", "down", "upset", "bad"]
    let greetingWords: [String] = ["hi", "hello", "how are you", "what's up", "howdy"]
    
    var inputWords: [String] = []
    var outputWords: [String] = []
    
    func getInputWords() -> [String] {
        return self.inputWords
    }
    func getOutputWords() -> [String] {
        return self.outputWords
    }
    
    func getWordsFromString(pUserInput: String) -> [String] {
        // first convert all letters in string to lowercase:
        let lInputLowerCase = pUserInput.lowercased()
        // then remove the "new line" at the end:
        let lInputWithoutNewline = lInputLowerCase.components(separatedBy: "\n")
        // then take all the text that found before the "new line",
        //    and use the " " space character to split it into words:
        let lInputWords = lInputWithoutNewline[0].components(separatedBy: " ")
        // return all found words placed in an array of strings:
        return lInputWords
    } // end of getWordsFromString()
    
    func findEmotionWords(responseWords: [String]) -> [String] {
        var emotion: [String] = []
        
        for word in responseWords {
            
            if let joyIndex = self.joyWords.firstIndex(of: word) {
                if (joyIndex >= 0) {
                    emotion.append("joy")
                }
            } else if let disgustIndex = self.disgustWords.firstIndex(of: word) {
                if (disgustIndex >= 0) {
                    emotion.append("disgust")
                }
            } else if let fearIndex = self.fearWords.firstIndex(of: word)  {
                if (fearIndex >= 0) {
                    emotion.append("fear")
                }
            } else if let angerIndex = self.angerWords.firstIndex(of: word)  {
                if (angerIndex >= 0) {
                    emotion.append("anger")
                }
            } else if let sadnessIndex = self.sadnessWords.firstIndex(of: word)  {
                if (sadnessIndex >= 0) {
                    emotion.append("sadness")
                }
            } else if let greetingIndex = self.greetingWords.firstIndex(of: word)  {
                if (greetingIndex >= 0) {
                    emotion.append("greeting")
                }
            }
        }
        
        return emotion
    }
    
    
    func parseUserResponse(response: String) -> String {
        var loremResponse = "> "
        let parsedResponse = getWordsFromString(pUserInput: response)
        let emotion = findEmotionWords(responseWords: parsedResponse)
        print(emotion)
        
        if (parsedResponse[0] == "") {
            loremResponse += "I can't help, if you will not chat with me!\n"
        // greeting
        }
        if (emotion.contains("greeting")){
            loremResponse += "Hello! "
        // joy
        }
        if (emotion.contains("joy")){
            loremResponse += "I'm glad you are happy. "
        }// disgust
        if (emotion.contains("disgust")){
            loremResponse += "What makes you disgusted? "
        }// fear
        if (emotion.contains("fear")){
            loremResponse += "What makes you scared? "
        }// anger
        if (emotion.contains("anger")){
            loremResponse += "What makes you angry? "
        }// sadness
        if (emotion.contains("sadness")){
            loremResponse += "What makes you sad? "
        }// none of the categories
        if (emotion == []) {
            loremResponse += "That's interesting, please tell me more. "
        }
        
        loremResponse += "\n"
        self.inputWords.append(response)
        self.outputWords.append(loremResponse)
        
        return loremResponse
    }
}
