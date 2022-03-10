
import Combine
import Connector

@dynamicMemberLookup
open class Lens<Content>: ContentConnectableProtocol {

    open var contents: Published<Content>.Publisher {
        $content
    }

    @Published internal var content: Content {
        willSet {
            willUpdate(to: newValue, current: content)
        }
        didSet {
            didUpdate(content: content)
        }
    }

    public required convenience init?(from input: Any) {
        if let content = input as? Content {
            self.init(with: content)
        }
        return nil
    }

    public init(with content: Content) {
        self.content = content
        postInit()
    }

    open func postInit() {}

    open func willUpdate(
        to content: Content,
        current: Content
    ) {}

    open func didUpdate(
        content: Content
    ) {}

    public func getContent<Self>(for _: Self) -> Content {
        content
    }

    open subscript<U>(
        dynamicMember keyPath: ReferenceWritableKeyPath<Content, U>
    ) -> U {
        set { content[keyPath: keyPath] = newValue }
        get { content[keyPath: keyPath] }
    }

    open subscript<U>(
        dynamicMember keyPath: WritableKeyPath<Content, U>
    ) -> U {
        set { content[keyPath: keyPath] = newValue }
        get { content[keyPath: keyPath] }
    }

    open subscript<U>(
        dynamicMember keyPath: KeyPath<Content, U>
    ) -> U {
        get { content[keyPath: keyPath] }
    }
}
