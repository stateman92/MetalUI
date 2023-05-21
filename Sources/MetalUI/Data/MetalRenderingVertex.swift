import MetalKit

public struct MetalRenderingVertex {
    public let position: SIMD3<Float>
    public let color: SIMD4<Float>

    public init(position: SIMD3<Float>, color: SIMD4<Float>) {
        self.position = position
        self.color = color
    }
}
