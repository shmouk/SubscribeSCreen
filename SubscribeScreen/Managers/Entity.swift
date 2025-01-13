import Foundation
import UIKit


class Constants {
    static let screenHeight = UIScreen.main.bounds.size.height
    
    static func formatTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d : %02d", minutes, seconds)
    }
    
    static func getCurrentDateAndTime() -> (date: String, time: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM d"
        let date = Date()
        let formattedDate = dateFormatter.string(from: date)
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        let formattedTime = timeFormatter.string(from: date)
        
        return (date: formattedDate, time: formattedTime)
    }

}
