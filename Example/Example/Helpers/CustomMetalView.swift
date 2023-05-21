//
//  CustomMetalView.swift
//  Example
//
//  Created by Kristóf Kálai on 2023. 05. 21..
//

import MetalUI
import MetalKit

final class CustomMetalView: BasicMetalView {
    override func configureMTKView() {
        colorPixelFormat = .bgra8Unorm
        clearColor = MTLClearColor(red: 1, green: 0.57, blue: 0.25, alpha: 1)
    }

    override func renderer(forDevice device: MTLDevice) -> MetalRendering {
        BasicMetalRenderer(vertices: [
            MetalRenderingVertex(position: SIMD3(0, 0.75, 0), color: SIMD4(1, 0, 0, 1)),
            MetalRenderingVertex(position: SIMD3(-0.75, -0.75, 0), color: SIMD4(0, 1, 0, 1)),
            MetalRenderingVertex(position: SIMD3(0.75, -0.75, 0), color: SIMD4(0, 0, 1, 1))
        ], device: device)
    }
}
