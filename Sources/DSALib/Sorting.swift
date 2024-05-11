import Foundation

struct Sorting {
    /// Sort int array
    /// Select a pivot 
    /// divide elements smaller than pivot in left and largers in right
    /// Continue until sub array contains only one element
    /// Merge sorted subarrays
    /// Time Complexity: nlog(n)
    /// Space Complexity: log(n)

    func quickSort(elements: [Int]) -> [Int] {
        if elements.count <= 1 {
            return elements
        }
        let midValue = elements.count / 2
        let pivot: Int = elements[midValue]
        var left  = [Int]()
        var right = [Int]()

        for element in elements {
            if element < pivot { left.append(element) }
            if element > pivot { right.append(element) }
        }
        return quickSort(elements: left) + [pivot] + quickSort(elements: right)
    }

    private func partition(arr: inout [Int], low: Int, high: Int) -> Int {
        let pivot = arr[high]
        var i = low - 1
        for index in low...high {
            if arr[index] < pivot {
                i += 1
                arr.swapAt(index, i)
            }
        }
        arr.swapAt(i + 1, high)
        return i + 1
    }
    
    func quickSortInPlace(arr: inout [Int], low: Int, high: Int) {
        if low < high {
            let pivot = partition(arr: &arr, low: low, high: high)
            
            quickSortInPlace(arr: &arr, low: low, high: pivot-1)
            quickSortInPlace(arr: &arr, low: pivot + 1, high: high)
        }
    }
    
    /// Merge sort
    ///
    private func merge(left: [Int], right: [Int]) -> [Int] {
        var mergedArray = [Int]()
        
        var leftIndex = 0
        var rightIndex = 0
        
        while leftIndex < left.count && rightIndex < right.count {
            if left[leftIndex] < right[rightIndex] {
                mergedArray.append(left[leftIndex])
                leftIndex += 1
            } else {
                mergedArray.append(right[rightIndex])
                rightIndex += 1
            }
        }
        
        while leftIndex < left.count {
            mergedArray.append(left[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < right.count {
            mergedArray.append(right[rightIndex])
            rightIndex += 1
        }
        
        return mergedArray
    }
    
    func mergeSort(list: [Int]) -> [Int] {
        if list.count <= 1 {
            return list
        }
        
        let midValue = list.count / 2
        let left = mergeSort(list: Array(list[..<midValue]))
        let right = mergeSort(list: Array(list[midValue...]))
        
        return merge(left: left, right: right)
    }
}
