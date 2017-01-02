import Foundation

extension Date {

	static var epoch      : Date { return Date(timeIntervalSince1970: 0) }
	static var endOfTimes : Date { return Date(timeIntervalSince1970: 9999999999) }

    static func fromString(text: String) -> Date {
    	return Date.fromString(text: text, format: "yyyy-MM-dd HH:mm:ss") // No format, use default
    }
    
    static func fromString(text: String, format: String) -> Date {
        let epoch = Date(timeIntervalSince1970: 0)
        if text.isEmpty { return epoch }

        var time = text
        if text.characters.count > 19 { time = text.subtext(to: 19) }

        let formatter = DateFormatter()
        formatter.dateFormat = format
        guard let date = formatter.date(from: time) else { return epoch }

        return date
    }
    
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let text = formatter.string(from: self)
        return text
    }
    
    func toString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let text = formatter.string(from: self)
        return text
    }

	func timeAgo() -> String {
	    //guard let date = self else { return "time ago?" }
/*
	    let now = Date()
	    let calendar = Calendar.current
	    let unitFlags = Set<Calendar.Component>([.second, .minute, .hour, .day, .weekOfYear, .month, .year])
	    //let components = calendar.dateComponents(unitFlags, from: self, to: now)
*/
/*
        let year = calendar.component(.year, from: self, to: now)
        let month = calendar?.component(.month, from: self, to: now)
        let day = calendar?.component(.weekdayOrdinal, from: self, to: now)
        let hour = calendar?.component(.hour, from: self, to: now)
        let minutes = calendar?.component(.minute, from: self, to: now)
        let seconds = calendar?.component(.second, from: self, to: now)
*/
/*
	    let now = Date()
   	    let calendar = Calendar.current
	    let unitFlags: NSCalendar.Unit = [.second, .minute, .hour, .day, .weekOfYear, .month, .year]
	    let components = (calendar as NSCalendar).components(unitFlags, from: self, to: now)
*/
	    /*
	    if let year = components.year, year >= 2 {
	        return "\(year) years ago"
	    }
	    
	    if let year = components.year, year >= 1 {
	        return "Last year"
	    }
	    
	    if let month = components.month, month >= 2 {
	        return "\(month) months ago"
	    }
	    
	    if let month = components.month, month >= 1 {
	        return "Last month"
	    }
	    
	    if let week = components.weekOfYear, week >= 2 {
	        return "\(week) weeks ago"
	    }
	    
	    if let week = components.weekOfYear, week >= 1 {
	        return "Last week"
	    }
	    
	    if let day = components.day, day >= 2 {
	        return "\(day) days ago"
	    }
	    
	    if let day = components.day, day >= 1 {
	        return "Yesterday"
	    }
	    
	    if let hour = components.hour, hour >= 2 {
	        return "\(hour) hours ago"
	    }
	    
	    if let hour = components.hour, hour >= 1 {
	        return "An hour ago"
	    }
	    
	    if let minute = components.minute, minute >= 2 {
	        return "\(minute) minutes ago"
	    }
	    
	    if let minute = components.minute, minute >= 1 {
	        return "A minute ago"
	    }
	    
	    if let second = components.second, second >= 3 {
	        return "\(second) seconds ago"
	    }
	    */
	    
	    return "Just now"
	}
/*
	func timeAgo() -> String {
	    
	    let calendar = Calendar.current
	    let now = Date()
	    let unitFlags: NSCalendar.Unit = [.second, .minute, .hour, .day, .weekOfYear, .month, .year]
	    let components = (calendar as NSCalendar).components(unitFlags, from: self, to: now, options: nil)
	    
	    if let year = components.year, year >= 2 {
	        return "\(year) years ago"
	    }
	    
	    if let year = components.year, year >= 1 {
	        return "Last year"
	    }
	    
	    if let month = components.month, month >= 2 {
	        return "\(month) months ago"
	    }
	    
	    if let month = components.month, month >= 1 {
	        return "Last month"
	    }
	    
	    if let week = components.weekOfYear, week >= 2 {
	        return "\(week) weeks ago"
	    }
	    
	    if let week = components.weekOfYear, week >= 1 {
	        return "Last week"
	    }
	    
	    if let day = components.day, day >= 2 {
	        return "\(day) days ago"
	    }
	    
	    if let day = components.day, day >= 1 {
	        return "Yesterday"
	    }
	    
	    if let hour = components.hour, hour >= 2 {
	        return "\(hour) hours ago"
	    }
	    
	    if let hour = components.hour, hour >= 1 {
	        return "An hour ago"
	    }
	    
	    if let minute = components.minute, minute >= 2 {
	        return "\(minute) minutes ago"
	    }
	    
	    if let minute = components.minute, minute >= 1 {
	        return "A minute ago"
	    }
	    
	    if let second = components.second, second >= 3 {
	        return "\(second) seconds ago"
	    }
	    
	    return "Just now"
	}
*/

}

// END