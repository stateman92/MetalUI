import MetalKit

public protocol MetalRendering: NSObject, MTKViewDelegate {
    var commandQueue: MTLCommandQueue? { get }
    var renderPipelineState: MTLRenderPipelineState? { get }
    var vertexBuffer: MTLBuffer? { get }
    var vertices: [MetalRenderingVertex] { get set }

    init()

    func createCommandQueue(device: MTLDevice)
    func createPipelineState(withLibrary library: MTLLibrary?, forDevice device: MTLDevice)
    func createBuffers(device: MTLDevice)

    /// MTKViewDelegate
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize)
    func draw(in view: MTKView)
}

extension MetalRendering {
    public init(vertices: [MetalRenderingVertex], device: MTLDevice) {
        self.init()
        
        self.vertices = vertices
        
        createCommandQueue(device: device)
        createPipelineState(withLibrary: device.makeDefaultLibrary(), forDevice: device)
        createBuffers(device: device)
    }
}
