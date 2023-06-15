import Foundation
import SwiftyCache

public struct SwiftyHTTP {
    private init() {}
    
    public static func request(_ request: SwiftyHTTPRequest, cache: URLCache = Cache.network, completion: @escaping (Result<SwiftyHTTPResponse<Data>, Error>) -> ()) {
        do {
            let configuration = URLSessionConfiguration.default
            configuration.urlCache = cache
            let session = URLSession(configuration: configuration)
            session.dataTask(with: try request()) { data, response, error in
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
    
    public static func request(_ request: SwiftyHTTPRequest, cache: URLCache = Cache.network) async -> Result<SwiftyHTTPResponse<Data>, Error> {
        return await withCheckedContinuation { continuation in
            Self.request(request, cache: cache) { result in
                continuation.resume(returning: result)
            }
        }
    }
        
    public static func throwingRequest(_ request: SwiftyHTTPRequest, cache: URLCache = Cache.network) async throws -> SwiftyHTTPResponse<Data> {
        let result: Result<SwiftyHTTPResponse<Data>, Error> = await Self.request(request)
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
}
