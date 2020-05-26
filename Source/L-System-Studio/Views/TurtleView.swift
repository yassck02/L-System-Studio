//
//  ViewBase.swift
//  L-System-Studio
//
//  Created by Connor yass on 3/17/19.
//  Copyright © 2019 HSY_Technologies. All rights reserved.
//

import MetalKit
import Combine

import CBTLogger

class TurtleView: MTKView, ObservableObject {
    
    // MARK: Statics
    
    static let fragmentShaderName: String = "fragment_shader"
    
    static let vertexShaderName: String = "vertex_shader"
    
    // MARK: Properties
    
    var turtle: Turtle
    
    var drawPercentage: Float = 1.0
    
    // MARK: Variables
    
    private var turtleOrigin = SIMD2<Float>(0, 0)
    
    private var verticies: [SIMD4<Float>] = []
    
    private var commandQueue: MTLCommandQueue!
    
    private var pipelineState: MTLRenderPipelineState!
    
    // MARK: Lifecycle
    
    init(turtle: Turtle, frame frameRect: CGRect) {
        self.turtle = turtle
        super.init(frame: frameRect, device: nil)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        device = MTLCreateSystemDefaultDevice()
        isPaused = true
        enableSetNeedsDisplay = true
        
        let library = device!.makeDefaultLibrary()
        let fragmentProgram = library!.makeFunction(name: TurtleView.fragmentShaderName)
        let vertexProgram = library!.makeFunction(name: TurtleView.vertexShaderName)
        
        let pipelineStateDescriptor = MTLRenderPipelineDescriptor()
        pipelineStateDescriptor.vertexFunction = vertexProgram
        pipelineStateDescriptor.fragmentFunction = fragmentProgram
        pipelineStateDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
        
        do {
            pipelineState = try device!.makeRenderPipelineState(descriptor: pipelineStateDescriptor)
        } catch let error as NSError {
            Log.error(error);
        }
        
        clearColor = MTLClearColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        commandQueue = device!.makeCommandQueue()
    }
    
    // MARK: Rendering
    
    override func draw(_ rect: CGRect) {
        
        guard !verticies.isEmpty else {
            Log.error("verticies.isEmpty"); return;
        }
        
        guard let commandBuffer = commandQueue.makeCommandBuffer() else {
            Log.error("commandQueue.makeCommandBuffer() failed"); return;
        }
        
        guard let renderPassDescriptor = currentRenderPassDescriptor else {
            Log.error("get currentRenderPassDescriptor failed"); return;
        }
        
        renderPassDescriptor.depthAttachment = .none
        
        guard let drawable = currentDrawable else {
            Log.error("get currentDrawable failed"); return;
        }
        
        guard let renderEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderPassDescriptor) else {
            Log.error("commandBuffer.makeRenderCommandEncoder(...) failed"); return;
        }
        
        renderEncoder.setRenderPipelineState(pipelineState)
        
        renderEncoder.setVertexBytes(
            &verticies,
            length: MemoryLayout<SIMD3<Float>>.stride * verticies.count,
            index: 0
        )
        
        renderEncoder.drawPrimitives(
            type: .line,
            vertexStart: 0,
            vertexCount: Int(Float(verticies.count) * drawPercentage),
            instanceCount: 1
        )
        
        renderEncoder.endEncoding()
        commandBuffer.present(drawable)
        commandBuffer.commit()
    }
    
    func render(sentance: String) {
        
        verticies.removeAll(keepingCapacity: true)
        
        var turtleState = TurtleState(position: turtleOrigin, angle: 0.0)
        var turtleStates: Stack<TurtleState> = []
        
        for character in sentance {
            guard let action = TurtleAction(rawValue: character) else { continue }
            
            switch action {
                case .turnLeft:
                    turtleState.angle -= Float.pi / 4.0
                
                case .turnRight:
                    turtleState.angle += Float.pi / 4.0
                
                case .moveForward:
                    
                    verticies.append(SIMD4<Float>(turtleState.position.x, turtleState.position.y, 0.0, 1.0))
                    
                    turtleState.position.x += cos(turtleState.angle) * turtle.moveDistance * 0.01
                    turtleState.position.y += sin(turtleState.angle) * turtle.moveDistance * 0.01
                    
                    verticies.append(SIMD4<Float>(turtleState.position.x, turtleState.position.y, 0.0, 1.0))
                
                case .jumpForward:
                                        
                    turtleState.position.x += cos(turtleState.angle) * turtle.moveDistance * 0.01
                    turtleState.position.y += sin(turtleState.angle) * turtle.moveDistance * 0.01
                
                case .pushStateToStack:
                    turtleStates.push(turtleState)
                
                case .popStateFromStack:
                    if let restoredState = turtleStates.pop() {
                        turtleState = restoredState
                }
            }
        }
        
        setNeedsDisplay()
    }
    
    // MARK: Helper Functions
    
    func setClearColor(_ color: CBColor) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        color.uiColor.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        clearColor = MTLClearColor(
            red:   Double(r),
            green: Double(g),
            blue:  Double(b),
            alpha: Double(a)
        )
    }
    
    /// Returns a UIImage of the spirograph
    func getImage() -> UIImage? {
        
        guard let texture = self.currentDrawable?.texture else {
            Log.error("self.currentDrawable?.texture is nil")
            return nil
        }
        
        guard let ciImage = CIImage(mtlTexture: texture, options: nil) else {
            Log.error("could not generate CIImage")
            return nil
        }
        
        return UIImage(ciImage: ciImage)
    }
}
