//
//  SwiftAPICallsWithAsyncAwaitView.swift
//  ConceptLibrary
//
//  Created by Lucas C Barros on 2024-04-05.
//

import SwiftUI

struct SwiftAPICallsWithAsyncAwaitView: View {
    @State private var user: GithubUser?
    
    var body: some View {
        VStack(spacing: 20) {
            
            // Nice to get image
            AsyncImage(url: URL(string: user?.avatarUrl ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .foregroundColor(.secondary)
            }
                .frame(width: 120, height: 120)
            
//            Text("Username")
            Text(user?.login ?? "Login Placeholder")
                .bold()
                .font(.title3)
            
//            Text("This is where the github bio will go")
            Text(user?.bio ?? "Bio Placeholder")
                .padding()
            
            Spacer()
        }
        .padding()
        
        // ".task" works same as OnAppear and makes async calls
        .task {
            do {
                user = try await getUser()
            } catch GithubError.invalidURL {
                print("Invalid URL")
            } catch GithubError.invalidResponse {
                print("Invalid Response")
            } catch GithubError.invalidData {
                print("Invalid data")
            } catch {
                print("Unexpected Error")
            }
        }
    }
    
    // MARK: Move this Network call in a ViewModel
    func getUser() async throws -> GithubUser {

        let endpoint = "https://api.github.com/users/sallen0400"

        guard let url = URL(string: endpoint) else {
            throw GithubError.invalidURL
        }
        
        // Here we apply the await
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Response not nil and status 200 is Successful
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw GithubError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            // Using ".convertFromSnakeCase" we can remove the snakeCase and still have matching property names
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(GithubUser.self, from: data)
        } catch {
            throw GithubError.invalidData
        }
    }
}

#Preview {
    SwiftAPICallsWithAsyncAwaitView()
}

// MARK: - GithubUser.swift
struct GithubUser: Codable {
    // Names need to match the JSON exactly
//    let avatar_url: String
    
    // However in Swift we don't use Snake_case
    let avatarUrl: String
    
    let login: String
    let bio: String
}

// MARK: - GithubError.swift
enum GithubError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
