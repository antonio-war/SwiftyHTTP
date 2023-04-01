import Foundation

public struct SwiftyHTTP {
    private init() {}
    
    public static func request(_ request: SwiftyHTTPRequest, completion: @escaping (Result<SwiftyHTTPResponse<Data>, Error>) -> ()) {
        do {
            URLSession.shared.dataTask(with: try request()) { data, response, error in
                guard let data, let response = response as? HTTPURLResponse else {
                    if let error {
                        completion(.failure(error))
                    } else {
                        completion(.failure(URLError(.badServerResponse)))
                    }
                    return
                }
                completion(.success(SwiftyHTTPResponse(urlResponse: response, body: data)))
            }.resume()
        } catch {
            completion(.failure(error))
        }
    }
    
    public static func request(_ request: SwiftyHTTPRequest) async -> Result<SwiftyHTTPResponse<Data>, Error> {
        return await withCheckedContinuation { continuation in
            Self.request(request) { result in
                continuation.resume(returning: result)
            }
        }
    }
}
