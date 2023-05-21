//
//  BasicMetalView.swift
//  
//
//  Created by Kristóf Kálai on 2023. 05. 21..
//

import MetalKit

open class BasicMetalView: MTKView, MetalPresenting {
    open var renderer: MetalRendering!

    public init(device: MTLDevice?) {
        super.init(frame: .zero, device: device)
        configure(device: device)
    }

    public convenience required init() {
        self.init(device: MTLCreateSystemDefaultDevice())
    }

    public required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func configureMTKView() {}

    open func renderer(forDevice device: MTLDevice) -> MetalRendering {
        fatalError("renderer(forDevice:) must be overridden!")
    }
}
