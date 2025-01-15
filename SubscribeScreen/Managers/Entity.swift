import Foundation
import UIKit // и Foundation и UIKit


class Constants { // у тебя файл называется Энтити, который лежит в папке Менеджеры. Как догадаться, что тут лежат константы? Касается, кстати, всей папки. Чего табличный менеджер лежит прям тут? Собери его в папку хотя бы 
    static let screenHeight = UIScreen.main.bounds.size.height
    
    static func formatTime(_ seconds: Int) -> String { // ... а, о. А откуда в классе "константы" может взяться функция принимаюшая и отдающая что-то?
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d : %02d", minutes, seconds) // хорошее решение
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
