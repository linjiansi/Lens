
import Combine

public protocol AnyContentConnectable {
    init?(from input: Any)
}

public protocol ContentConnectableProtocol: AnyContentConnectable {
    associatedtype Content
    var contents: Published<Content>.Publisher { get }
    func getContent<Self>(for _: Self) -> Content
}
