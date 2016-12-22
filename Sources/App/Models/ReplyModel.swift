import Vapor
import Foundation

class Reply: DataModel {
    var replyid  : Int    = 0
    var postid   : Int    = 0
    var userid   : Int    = 0
    var nick     : String = ""
    var date     : Date   = Date()
    var content  : String = ""
    var votes    : Int    = 0
    var votesup  : Int    = 0
    var votesdn  : Int    = 0
    var answer   : Bool   = false
    var hidden   : Bool   = false

    // init() { }

    func fromNode(_ node: Node) throws {
		replyid	= try node.extract("replyid")
		postid	= try node.extract("postid")
		userid	= try node.extract("userid")
		nick	= try node.extract("nick")
		date	= try node.extract("date", transform: Date.fromString)
		content	= try node.extract("content")
		votes	= try node.extract("votes")
		votesup	= try node.extract("votesup")
		votesdn	= try node.extract("votesdn")
		answer	= try node.extract("answer")
		hidden	= try node.extract("hidden")
    }

    func makeNode() throws -> Node {
        let node = try Node(node: [
			"replyid" : replyid,
			"postid"  : postid,
			"userid"  : userid,
			"nick"	  : nick,
			"date"	  : date.toString(),
			"content" : content,
			"votes"	  : votes,
			"votesup" : votesup,
			"votesdn" : votesdn,
			"answer"  : answer,
			"hidden"  : hidden
        ])

        return node
    }
}

extension Reply {
    func save() {
        print("Saving reply: ", replyid)
        if replyid < 1 { // New post, id not generated yet
            insert()
        } else {
            update()
        }
    }
    
    func insert() {
        // Map data to sql and insert
        let exclude = ["replyid", "date", "votes", "votesup", "votesdn", "answer", "hidden"]
        let fields = getFields(except: exclude)
        let params = getBindingsNode(for: fields)
        let sql    = getSqlInsert(table: "replies", fields: fields)
        let newId  = db.execute(sql, params: params)
        print("New ID: ", newId)
        //replyid = newId!.int!
        //print("New reply Id:", replyid)
    }
    
    func update() {
        let exclude = ["reply"]
        let fields  = getFields(except: exclude)
        let params  = getBindingsNode(for: fields)
        let sql     = getSqlUpdate(table: "replies", fields: fields, params: params, key: "replyid", id: replyid)
        let num     = db.execute(sql, params: params)
        
        if num!.int! < 1 {
            print("Error \(num) updating reply ", replyid)
        }
    }
    
    func delete() {
        let sql = getSqlDelete(table: "replies", key: "replyid")
        let args: [Node] = [Node(replyid)]
        let num = db.execute(sql, params: args)
        
        if num!.int! < 1 {
            print("Error \(num) deleting reply ", replyid)
        }
    }
    
    func get(id :Int) -> Reply? {
        let sql = "Select * from replies where replyid = $1 limit 1"
        let args: [Node] = [Node(id)]
        guard let rows = db.query(sql, params: args) else { return nil }
        guard let node = rows[0] else { return nil }
        try? self.fromNode(node)
        return self
    }

} 

// End