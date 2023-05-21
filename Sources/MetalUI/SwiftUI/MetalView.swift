import SwiftUI
import MetalKit

#if os(iOS)
public struct MetalView<Content: MetalPresenting>: UIViewRepresentable {
    private let content: () -> Content
    private var handleUpdateUIView: ((Content, Context) -> Void)?
    private var handleMakeUIView: ((Context) -> Content)?

    public init(content: @escaping () -> Content) {
        self.content = content
    }

    public func makeUIView(context: Context) -> Content {
        handleMakeUIView?(context) ?? content()
    }

    public func updateUIView(_ uiView: Content, context: Context) {
        handleUpdateUIView?(uiView, context)
    }
}

extension MetalView {
    public mutating func setMakeUIView(handler: @escaping (Context) -> Content) -> Self {
        handleMakeUIView = handler
        return self
    }

    public mutating func setUpdateUIView(handler: @escaping (Content, Context) -> Void) -> Self {
        handleUpdateUIView = handler
        return self
    }
}
#elseif os(macOS)
public struct MetalView<Content: MetalPresenting>: NSViewRepresentable {
    private var content: () -> Content
    private var handleUpdateNSView: ((Content, Context) -> Void)?
    private var handleMakeNSView: ((Context) -> Content)?

    public init(content: @escaping () -> Content) {
        self.content = content
    }

    public func makeNSView(context: Context) -> Content {
        handleMakeNSView?(context) ?? content()
    }

    public func updateNSView(_ nsView: Content, context: Context) {
        handleUpdateNSView?(nsView, context)
    }
}
extension MetalView {
    public mutating func setMakeNSView(handler: @escaping (Context) -> Content) -> Self {
        handleMakeNSView = handler
        return self
    }

    public mutating func setUpdateNSView(handler: @escaping (Content, Context) -> Void) -> Self {
        handleUpdateNSView = handler
        return self
    }
}
#endif
