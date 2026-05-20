//
//  FindTheCelebrity.swift
//  DSA-Practice
//
//  Created by Paridhi Malviya on 4/3/26.
//

class FindTheCelebrity {
    
    init() {
        
    }
    
    /*
     here we are each pair hence O(n^2)
     */
    func findCelebrity(_ n: Int) -> Int {
            var indegree = Array(repeating: 0, count: n)
            var celebrity = -1
            for i in 0..<n {
                for j in 0..<n {
                    if (i == j) {
                        continue
                    }
                    if (knows(i, j)) {
                        indegree[j] += 1
                        indegree[i] -= 1
                    }
                }
            }
            for i in 0..<n {
                if (indegree[i] == n - 1) {
                    return i
                }
            }
            return celebrity
        }
    
    /*
     elminination technique - 2 passes
     1st pass - elminate who all cant be celebrity
     keep track of potential candidate
     at last - 2nd pass -> If everybody knows potential candidate, then it's celeb
     if anybody doesn't know the potential candidate, return -1
     O(2n) -> O(n)
     */
    func findCelebrityUsingTwoPasses(_ n: Int) -> Int {
        var candidate = 0
        for i in 1..<n {
            if (knows(candidate, i)) {
                candidate = i
            }
        }

        for i in 0..<n {
            if (i == candidate) {
                continue
            }
            if (knows(candidate, i) || !knows(i, candidate)) {
                return -1
            }
        }
        return candidate
    }

}
