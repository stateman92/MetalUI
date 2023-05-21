import MetalKit

public protocol MetalPresenting: MTKView {
    var renderer: MetalRendering! { get set }

    init()

    func configureMTKView()
    func renderer(forDevice device: MTLDevice) -> MetalRendering
}

extension MetalPresenting {
    public func configure(device: MTLDevice? = MTLCreateSystemDefaultDevice()) {
        // Make sure we are on a device that can run metal!
        guard let device else {
            fatalError("Device loading error!")
        }

        renderer = renderer(forDevice: device)
        delegate = renderer
        configureMTKView()
    }
}
