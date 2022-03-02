
import Combine
import Foundation

public protocol ConnectingSubscriber: AnyObject, ContentConnectableProtocol where Self: Subscriber, Self.Content == Input {
    var cancellable: Cancellable? { get set }
    func take(_ input: Input)
    func handle(_ error: Self.Failure)
    func finished()
}

extension Subscriber where Self: ConnectingSubscriber {

    public typealias Failure = Never
    public typealias Input = Content

    public func receive(subscription: Subscription) {
        self.cancellable = subscription
        subscription.request(.unlimited)
    }

    public func receive(_ input: Content) -> Subscribers.Demand {
        take(input)
        return .unlimited
    }

    public func receive(completion: Subscribers.Completion<Never>) {
        switch completion {
            case .failure(let error):
                handle(error)
            case .finished:
                finished()
        }
    }

    public func handle(_ error: Never) {}
    public func finished() {}

}
