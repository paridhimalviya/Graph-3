//
//  OptmizeWaterDistributionInVillage.swift
//  DSA-Practice
//
//  Created by Paridhi Malviya on 5/18/26.
//

//Time complexity - O(v + E)
/*
 vertices - no of wells
 edges 
 */
class OptimizeWaterDistributionInVillage {
    
    init() {
        
    }
    
    func minCostToSupplyWater(_ n: Int, _ wells: [Int], _ pipes: [[Int]]) -> Int {
        var parent = [Int](repeating: 0, count: n+1)
        
        //set the node itself as parent for all nodes
        //0 - for the dummy node
        for i in 0...n {
            parent[i] = i
        }
        
        //first make a list of int array edges
        var edges = [[Int]]()
        for i in 1...n {
            edges.append([0, i, wells[i-1]])
        }
        
        for pipe in pipes {
            edges.append(pipe)
        }
        
        //the rule is to have the minimum cost. So sort this based on minimum cost.
        //to ask chatGPT - since we have sorted here, is that the reason we are not applying any rule ???
        //How thw code will look of we apply any rule ??? Give me the problems. I will solve and get the solutions verifies.
        edges.sort {(a, b) in
            a[2] < b[2]
        }
        
        var result = 0
        for edge in edges {
            let x = edge[0]
            let y = edge[1]
            
            let pX = find(x, parent: &parent) //ultimate parent of x
            let pY = find(y, parent: &parent) //ultimate parent of y
            if (pX != pY) {
                //merge these groups or unionize - anybody can be the parent of other one.
                result += edge[2]
                parent[pX] = pY //parent[pY] = pX
            }
        }
        return result
    }
    
    
    //it will find the parent of x and while returning back along the stack, it will set the unltimate parent as the parent of all the nodes. Changing the structure of the graph and make it flatter
    func find(_ x: Int, parent: inout [Int]) -> Int {
        
        if (parent[x] != x) {
            //if the parent of x is not x, it means it's something else. Go up the hieracrchy to find the ultimate parent
            parent[x] = find(parent[x], parent: &parent) //path reduction
        }
        return parent[x]
    }
}
