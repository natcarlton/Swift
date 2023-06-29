//
//  FriendsModel.swift
//  FriendsApp
//
//  Created by Natasha Carlton on 2/21/23.
//  nancarl@iu.edu
//

import Foundation

class FriendsModel {
    var friendsArr: [[String]] = [
//        ["Billie", "Holiday", "strange@fruit.jazz"],
//        ["jon", "hendricks", "cotton@tail.jazz"],
//        ["Carmen", "McRae", "round@midnight.jazz"],
//        ["Johnny", "Hartman", "lush@life.jazz"]
    ]
    var lastNameLetters: [String] = []
    
    
    func getNumberOfFriends() -> Int {
        return self.friendsArr.count
    }
    
    func getFriendsForSection(section: Int) -> [[String]] {
        // sort friends before we return them
        sortFriends()
        // get the letter for the current section
        let lastNameLetter = self.lastNameLetters[section].uppercased()
        var friendsInSection: [[String]] = []
        
        if friendsArr.count > 0 {
            for friend in friendsArr {
                // if the last name letter is the same as teh letter in the current section then add the friend to our section
                if let friendLastNameLetter = friend[1].first?.uppercased() {
                    if (String(friendLastNameLetter) == lastNameLetter) {
                        friendsInSection.append(friend)
                    }
                }
            }
        }
        return friendsInSection
    }
    
    func getLastNameLetters() -> [String] {
        // this will return all the last name letters that exist in the friends list so that we can get the proper sections
        var currLastNameLetters: [String] = []
        
        if self.friendsArr.count > 0 {
            for friend in self.friendsArr {
                if let lastNameLetter = friend[1].first {
                    // if the first letter of the last name of the friend hasn't been added to the list, we add it
                    let currLastNameLetter = String(lastNameLetter).uppercased()
                    if (currLastNameLetters.firstIndex(of: currLastNameLetter) == nil) {
                        currLastNameLetters.append(currLastNameLetter)
                    }
                }
            }
        }
        // we need to sort the letters
        self.lastNameLetters = currLastNameLetters.sorted()
        return self.lastNameLetters
    }
    
    func sortFriends() {
        var sortedFriends: [[String]] = self.friendsArr
        
        // mark, ethan, tyler, stan
        var swap = true
        // if there is only 1 friend, the list is already sorted and we also cannot sort 0 friends
        if (sortedFriends.count > 1) {
            while swap {
                // if swap stays false, we are done
                swap = false
                for i in 0...sortedFriends.count - 2 {
                    let lastFriendLastName = sortedFriends[i + 1][1].uppercased()
                    let lastFriendFirstName = sortedFriends[i + 1][0].uppercased()
                    let currFriendLastName = sortedFriends[i][1].uppercased()
                    let currFriendFirstName = sortedFriends[i][0].uppercased()
                    
                    // if they have the same last name, sort by first name
                    if (lastFriendLastName == currFriendLastName) {
                        if (lastFriendFirstName < currFriendFirstName) {
                            let tempFriend = sortedFriends[i]
                            
                            sortedFriends[i] = sortedFriends[i + 1]
                            sortedFriends[i + 1] = tempFriend
                            
                            swap = true
                        }
                    // different last names
                    } else if (lastFriendLastName < currFriendLastName) {
                        let tempFriend = sortedFriends[i]
                        
                        sortedFriends[i] = sortedFriends[i + 1]
                        sortedFriends[i + 1] = tempFriend
                        
                        swap = true
                    }
                }
            }
        }
        self.friendsArr = sortedFriends
    }
    
    func addNewFriend(firstName: String, lastName: String, email: String) {
        self.friendsArr.append([firstName, lastName, email])
    }
    
}
