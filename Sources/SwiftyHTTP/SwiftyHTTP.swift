import Foundation

public struct SwiftyHTTP {
    private init() {}
    
    public static func request(with representable: URLRequestRepresentable, completion: @escaping (Result<SwiftyHTTPResponse<Data>, Error>) -> ()) {
        do {
            URLSession.shared.dataTask(with: try representable()) { data, response, error in
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
    
    public static func request(with representable: URLRequestRepresentable) async -> Result<SwiftyHTTPResponse<Data>, Error> {
        return await withCheckedContinuation { continuation in
            request(with: representable) { result in
                continuation.resume(returning: result)
            }
        }
    }
}
