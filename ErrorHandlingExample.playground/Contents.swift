// taken from HackingWithSwift https://www.hackingwithswift.com/quick-start/beginners/how-to-handle-errors-in-functions#:~:text=When%20it%20comes%20to%20catching,)%22)%20%7D%20catch%20PasswordError.

enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch {
    print("There was an error.")
}

