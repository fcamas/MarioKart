func findPairs(_ enrollments: [[String]]) -> [String: [String]] {
    var result: [String: [String]] = [:]
    
    // Create a dictionary to store the courses for each student
    var courseDict: [String: [String]] = [:]
    
    // Populate the courseDict
    for enrollment in enrollments {
        let studentID = enrollment[0]
        let course = enrollment[1]
        
        if courseDict[studentID] == nil {
            courseDict[studentID] = []
        }
        courseDict[studentID]?.append(course)
    }
    
    // Find courses shared between pairs of students
    let studentIDs = courseDict.keys.sorted()
    
    for i in 0..<studentIDs.count {
        for j in (i + 1)..<studentIDs.count {
            let studentID1 = studentIDs[i]
            let studentID2 = studentIDs[j]
            
            let courses1 = Set(courseDict[studentID1]!)
            let courses2 = Set(courseDict[studentID2]!)
            
            let sharedCourses = Array(courses1.intersection(courses2))
            
            let key = "\(studentID1),\(studentID2)"
            result[key] = sharedCourses
        }
    }
    
    return result
}

// Sample Input
let enrollments1 = [
    ["58", "Linear Algebra"],
    ["94", "Art History"],
    ["94", "Operating Systems"],
    ["17", "Software Design"],
    ["58", "Mechanics"],
    ["58", "Economics"],
    ["17", "Linear Algebra"],
    ["17", "Political Science"],
    ["94", "Economics"],
    ["25", "Economics"],
    ["58", "Software Design"],
]

// Sample Output
let result1 = findPairs(enrollments1)
for (key, value) in result1 {
    print("\(key): \(value)")
}

// Additional test cases
let enrollments2 = [
    ["0", "Advanced Mechanics"],
    ["0", "Art History"],
    ["1", "Course 1"],
    ["1", "Course 2"],
    ["2", "Computer Architecture"],
    ["3", "Course 1"],
    ["3", "Course 2"],
    ["4", "Algorithms"]
]

let result2 = findPairs(enrollments2)
for (key, value) in result2 {
    print("\(key): \(value)")
}

let enrollments3 = [
    ["23", "Software Design"],
    ["3", "Advanced Mechanics"],
    ["2", "Art History"],
