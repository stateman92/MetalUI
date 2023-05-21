//
//  BasicMetalRenderer.swift
//  Example
//
//  Created by Kristóf Kálai on 2023. 05. 21..
//

import MetalUI
import MetalKit

final class BasicMetalRenderer: NSObject, MetalRendering {
    enum MetalError: Error {
        case missingFunction
    }

    private(set) var commandQueue: MTLCommandQueue?
    private(set) var renderPipelineState: MTLRenderPipelineState?
    private(set) var vertexBuffer: MTLBuffer?
    var vertices: [MetalRenderingVertex] = []

    func createCommandQueue(device: MTLDevice) {
        commandQueue = device.makeCommandQueue()
    }

    func createPipelineState(withLibrary library: MTLLibrary?, forDevice device: MTLDevice) throws {
        guard let vertexFunction = library?.makeFunction(name: "basic_vertex_function"),
              let fragmentFunction = library?.makeFunction(name: "basic_fragment_function") else {
            throw MetalError.missingFunction
        }

        let renderPipelineDescriptor = MTLRenderPipelineDescriptor()
        renderPipelineDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
        renderPipelineDescriptor.vertexFunction = vertexFunction
        renderPipelineDescriptor.fragmentFunction = fragmentFunction

        renderPipelineState = try device.makeRenderPipelineState(descriptor: renderPipelineDescriptor)
    }

    func createBuffers(device: MTLDevice) {
        vertexBuffer = device.makeBuffer(bytes: vertices, length: MemoryLayout<MetalRenderingVertex>.stride * vertices.count, options: [])
    }

    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {}

    func draw(in view: MTKView) {
        guard let drawable = view.currentDrawable,
              let renderPassDescriptor = view.currentRenderPassDescriptor,
              let commandBuffer = commandQueue?.makeCommandBuffer(),
              let renderPipelineState,
              let commandEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderPassDescriptor) else {
            return
        }

        commandEncoder.setRenderPipelineState(renderPipelineState)
        commandEncoder.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        commandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: vertices.count)

        commandEncoder.endEncoding()
        commandBuffer.present(drawable)
        commandBuffer.commit()
    }
}
