import Foundation

struct CatFact: Codable {
    let fact: String
    let length: Int
}

struct CatFactSequence: AsyncSequence {
    typealias Element = CatFact
    
    let count: Int
    
    func makeAsyncIterator() -> CatFactIterator {
        return CatFactIterator(count: count)
    }
}

struct CatFactIterator: AsyncIteratorProtocol {
    let count: Int
    var currentCount = 0
    let url = URL(string: "https://catfact.ninja/fact")!

    mutating func next() async throws -> CatFact? {
        guard currentCount < count else {
            return nil
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let catFact = try decoder.decode(CatFact.self, from: data)
        currentCount += 1

        return catFact
    }
}

func fetchCatFacts(count: Int) async throws {
    let sequence = CatFactSequence(count: count)
    for try await catFact in sequence {
        print(catFact.fact)
    }
}

// Example
Task {
    do{
        try await fetchCatFacts(count: 10)
    } catch {
        print("Error fetching cat facts \(error)")
    }
}
