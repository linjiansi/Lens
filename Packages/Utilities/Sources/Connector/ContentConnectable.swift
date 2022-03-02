
public protocol AnyContentConnectable {
    init?(from input: Any)
}

public protocol ContentConnectableProtocol: AnyContentConnectable {
    associatedtype Content
    func getContent<Self>(for _: Self) -> Content
}
