import SwiftData
import Foundation

@Model
class Communication: Identifiable {
    @Attribute var id: UUID = UUID()
    @Attribute var subject: String
    @Attribute var communicationBody: String
    @Attribute var sendingGroup: String
    @Attribute var campaign: String
    @Attribute var future: Bool

    init(subject: String, communicationBody: String, sendingGroup: String, campaign: String, future: Bool) {
        self.subject = subject
        self.communicationBody = communicationBody
        self.sendingGroup = sendingGroup
        self.campaign = campaign
        self.future = future
    }
}
