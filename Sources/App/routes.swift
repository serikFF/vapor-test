import Vapor

struct Project: Content {
    var title: String
    var description: String
    var gifURLs: [String]?
    var githubURL: String
}

struct PortfolioContext: Content {
    let phone: String
    let telegramUsername: String
    let githubUsername: String
    let projects: [Project]
}

func routes(_ app: Application) throws {
    app.get { req -> EventLoopFuture<View> in
        let phone = "+996 (700) 508-300"
        let telegramUsername = "darmaraht"
        let githubUsername = "darmaraht"

        let projects: [Project] = [
            Project(
                title: "RickMorty",
                description: "Rick and Morty — это iOS приложение, разработанное для моего портфолио. Приложение использует UIKit и поддерживает локализацию на русский и английский языки. Оно предоставляет удобный доступ к данным из мультсериала 'Рик и Морти' как онлайн, так и оффлайн, используя современные инструменты и библиотеки для iOS разработки.",
                gifURLs: [
                    "/images/RickMortyPreview.gif",
                    "/images/RickMortyPreview2.gif",
                    "/images/RickMortyPreview3.gif",
                ],
                githubURL: "https://github.com/darmaraht/RickMorty"
            ),
            Project(
                title: "CameraApp",
                description: "CameraApp — это iOS приложение, которое поддерживает просмотр, создание и управление изображениями с функциями галереи и камеры.",
                gifURLs: [
                    "/images/CameraApp.gif",
                ],
                githubURL: "https://github.com/darmaraht/CameraApp"
            )
        ]

        let context = PortfolioContext(
            phone: phone,
            telegramUsername: telegramUsername,
            githubUsername: githubUsername,
            projects: projects
        )

        return req.view.render("portfolio", context)
    }
}
