
@dynamicMemberLookup
open class DualLens<Source, Content>: Lens<Content> {

    internal var source: Source {
        willSet {
            willUpdate(to: newValue, current: source)
        }
        didSet {
            didUpdate(source: source)
        }
    }

    open func willUpdate(
        to source: Source,
        current: Source
    ) {}

    open func didUpdate(
        source: Source
    ) {}

    public init(
        with content: Content,
        from source: Source
    ) {
        self.source = source
        super.init(with: content)
    }

    public required convenience init?(from input: Any) {
        return nil
    }

    public func getSource<Self>(for _: Self) -> Source {
        self.source
    }

    open override subscript<U>(dynamicMember keyPath: ReferenceWritableKeyPath<Content, U>) -> U {
        set { content[keyPath: keyPath] = newValue }
        get { content[keyPath: keyPath] }
    }

    open override subscript<U>(dynamicMember keyPath: WritableKeyPath<Content, U>) -> U {
        set { content[keyPath: keyPath] = newValue }
        get { content[keyPath: keyPath] }
    }

    open override subscript<U>(dynamicMember keyPath: KeyPath<Content, U>) -> U {
        get { content[keyPath: keyPath] }
    }

    open subscript<U>(dynamicMember keyPath: ReferenceWritableKeyPath<Source, U>) -> U {
        set { source[keyPath: keyPath] = newValue }
        get { source[keyPath: keyPath] }
    }

    open subscript<U>(dynamicMember keyPath: WritableKeyPath<Source, U>) -> U {
        set { source[keyPath: keyPath] = newValue }
        get { source[keyPath: keyPath] }
    }

    open subscript<U>(dynamicMember keyPath: KeyPath<Source, U>) -> U {
        get { source[keyPath: keyPath] }
    }
}
