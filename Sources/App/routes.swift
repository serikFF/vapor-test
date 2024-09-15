import Vapor

func routes(_ app: Application) throws {
    
    app.get { req -> EventLoopFuture<View> in
        req.view.render("index")
    }
    
    try app.register(collection: UserController())
}
