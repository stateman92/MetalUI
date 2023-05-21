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
        content()
    }

    public func updateUIView(_ uiView: Content, context: Context) {}
}
#elseif os(macOS)
public struct MetalView<Content: MetalPresenting>: NSViewRepresentable {
    private let content: () -> Content

    public init(content: @escaping () -> Content) {
        self.content = content
    }

    public func makeNSView(context: Context) -> Content {
        content()
    }

    public func updateNSView(_ nsView: Content, context: Context) {}
}
#endif
