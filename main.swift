func swap(words: inout [String], one: Int, two: Int) {
    let temp = words[one]
    words[one] = words[two]
    words[two] = temp
}

func partition(low: Int, high: Int, words: inout [String]) -> Int {
    let pivot = words[high]
    var i = low - 1

    for j in low ..< high {
        if words[j] < pivot {
            i += 1
            swap(words: &words, one: i, two: j)
        }        
    }
    swap(words: &words, one: i + 1, two: high)
    return i + 1
}

func optimalSort(low: Int, high: Int, words: inout [String]) {
    if low >= high {
        return
    }
    var low = low
    var high = high
    while low < high {        
        let pi = partition(low: low, high: high, words: &words)
        if pi - low < high - pi {
            optimalSort(low: low, high: pi - 1, words: &words)
            low = pi + 1
        } else {
            optimalSort(low: pi + 1, high: high, words: &words)
            high = pi - 1
        }
    }
}

func main() {
    var words : [String] = []
    while let input = readLine() {
        words.append(input)
    }

    var sorted = false

    if words.count > 1 {
        for i in 0 ... 2 {
            if !sorted {
                switch i {
                case 0:
                    print("Checking if in order")
                    for i in  0 ..< words.count - 1 {
                        if words[i] > words[i+1] {
                            print("Not ordered")
                            break
                        }
                        if i == words.count - 2 {
                            print("Ordered")
                            sorted = true
                        }
                    }              
                case 1:
                    print("Checking if in reverse-order")
                    let reversedWords : [String] = words.reversed()
                    for i in 0 ..< reversedWords.count - 1 {
                        if reversedWords[i] > reversedWords[i+1] {                            
                            print("Not reverse-ordered, \(reversedWords[i]) is larger than \(reversedWords[i+1])")
                            break
                        }
                        if i == words.count - 2 {
                            print("Reverse-Ordered")
                            words = reversedWords
                            sorted = true
                        }
                    }
                case 2:
                    print("Quick Sorting")
                    optimalSort(low: 0, high: words.count - 1, words: &words)
                    sorted = true
                default:
                    fatalError()
                }
            }
        }
    }
    
    for word in words {
        print(word)
    }
}

main()
