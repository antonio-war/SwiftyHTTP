import Foundation

public struct SwiftyHTTP {
    private init() {}
    
    public static func request(with representable: URLRequestRepresentable, log: Bool = false, completion: @escaping (Result<SwiftyHTTPResponse<Data>, Error>) -> ()) {
        do {
            if log, let body = try? representable().httpBody {
                print("------------------------------------------------------------------------")
                print("SwiftyHTTPRequest.body:\n")
                print(String(decoding: body, as: UTF8.self))
                print("------------------------------------------------------------------------")
            }
            
            URLSession.shared.dataTask(with: try representable()) { data, response, error in
                guard let data, let response = response as? HTTPURLResponse else {
                    if let error {
                        completion(.failure(error))
                    } else {
                        completion(.failure(URLError(.badServerResponse)))
                    }
                    return
                }
                
                if log {
                    print("------------------------------------------------------------------------")
                    print("SwiftyHTTPResponse.body:\n")
                    print(String(decoding: data, as: UTF8.self))
                    print("------------------------------------------------------------------------")
                }
                
                completion(.success(SwiftyHTTPResponse(urlResponse: response, body: data)))
            }.resume()
        } catch {
            completion(.failure(error))
        }
    }
    
    @available(iOS 13.0.0, *)
    public static func request(with representable: URLRequestRepresentable, log: Bool = false) async -> Result<SwiftyHTTPResponse<Data>, Error> {
        return await withCheckedContinuation { continuation in
            request(with: representable) { result in
                continuation.resume(returning: result)
            }
        }
    }
    
    public static func request<Body: SwiftyHTTPBody>(with representable: URLRequestRepresentable, body: Body.Type, log: Bool = false, completion: @escaping (Result<SwiftyHTTPResponse<Body>, Error>) -> ()) {
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
    
    @available(iOS 13.0.0, *)
    public static func request<Body: SwiftyHTTPBody>(with representable: URLRequestRepresentable, body: Body.Type, log: Bool = false) async -> Result<SwiftyHTTPResponse<Body>, Error> {
        return await withCheckedContinuation { continuation in
            request(with: representable, body: body) { result in
                continuation.resume(returning: result)
            }
        }
    }
}
