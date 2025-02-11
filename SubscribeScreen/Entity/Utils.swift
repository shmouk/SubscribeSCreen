struct TimeUtils {
    static func formatTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d : %02d", minutes, seconds)
    }
}
