import SwiftData
import Foundation

@Model
class Communication: Identifiable {
    @Attribute var id: UUID = UUID()
    @Attribute var subject: String
    @Attribute var sendingGroup: String
    @Attribute var category: String
    @Attribute var future: Bool

    init(subject: String, sendingGroup: String, category: String, future: Bool) {
        self.subject = subject
        self.sendingGroup = sendingGroup
        self.category = category
        self.future = future
    }
}
