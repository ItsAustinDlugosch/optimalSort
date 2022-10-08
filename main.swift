var wordsList : [String] = []
while let input = readLine() {
    wordsList.append(input)
}

func swap(arr: inout [String], one: Int, two: Int) {
    let placeholder = arr[one]
    arr[one] = arr[two]
    arr[two] = placeholder
}

func partition(low: Int, high: Int, arr: inout [String]) -> Int {
    let pivot = arr[high]
    var part = low - 1

    for j in low ..< high {
        if arr[j] < pivot {
            part += 1
            swap(arr: &arr, one: j, two: part)
        }        
    }
    swap(arr: &arr, one: part + 1, two: high)
    return part + 1
}

func quicksort(low: Int, high: Int, arr: inout [String]) -> [String] {
    if arr.count == 1 {
        return arr
    }
    if low < high {
        let pi = partition(low: low, high: high, arr: &arr)
        let _  = quicksort(low : low, high: pi - 1, arr: &arr)
        let _  = quicksort(low : pi + 1, high: high, arr: &arr)
    }
    return arr
}

let sortedWords = quicksort(low: 0, high: wordsList.count - 1, arr: &wordsList)
for i in sortedWords {
    print(i)
}
