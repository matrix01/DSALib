//
//  File.swift
//  
//
//  Created by Milan on 2024/05/11.
//

import Foundation

class Node {
    var data: Int
    var next: Node?
    
    init(data: Int) {
        self.data = data
    }
}

class LinkedList {
    var head: Node?
    
    func insert(data: Int) {
        let new = Node(data: data)
        
        /// No data inserted yet
        if head == nil {
            head = new
            return
        }
        
        /// Find the last empty next and insert
        var temp = head
        while(temp?.next != nil) {
            temp = temp?.next
        }
        temp?.next = new
    }
    /// 10, 25
    func delete(data: Int) {
        guard let head = head else {
            return
        }
        
        /// if trying to delete the first element
        if head.data == data {
            self.head = head.next
            return
        }
        
        /// not the head element
        var prev: Node? = head
        while prev?.next?.data != data {
            prev = prev?.next
        }
        
        if let next = prev?.next?.next {
            prev?.next = next
        } else {
            /// last element of the list
            prev?.next = nil
        }
    }
    
    func printAll() {
        print("------------START---------------")
        var temp = head
        while(temp?.next != nil) {
            print(String(temp?.data ?? -1))
            temp = temp?.next
        }
        print(String(temp?.data ?? -1))
        print("------------END----------------")
    }
}
