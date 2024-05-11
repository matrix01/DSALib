import Foundation

struct Sorting {
    func quickSort(elements: [Int]) -> [Int] {
        if elements.count <= 1 {
            return elements
        }

        let pivot: Int = elements.count / 2
        var left  = [Int]()
        var right = [Int]()

        for element in elements {
            element < pivot ? left.append(element) : right.append(element)
        }
        return quickSort(elements: left) + [pivot] + quickSort(elements: right)
    }
}
