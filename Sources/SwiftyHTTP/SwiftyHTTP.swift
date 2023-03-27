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
            }
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
    
    public static func request<Body: SwiftyHTTPBody>(with representable: URLRequestRepresentable, body: Body.Type, completion: @escaping (Result<SwiftyHTTPResponse<Body>, Error>) -> ()) {
        request(with: representable) { result in
            switch result {
            case .success(let response):
                do {
                    let body = try JSONDecoder().decode(body, from: response.body)
                    completion(.success(SwiftyHTTPResponse(urlResponse: try response(), body: body)))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public static func request<Body: SwiftyHTTPBody>(with representable: URLRequestRepresentable, body: Body.Type) async -> Result<SwiftyHTTPResponse<Body>, Error> {
        return await withCheckedContinuation { continuation in
            request(with: representable, body: body) { result in
                continuation.resume(returning: result)
            }
        }
    }
}
