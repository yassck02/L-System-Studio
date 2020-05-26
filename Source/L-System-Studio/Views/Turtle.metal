//
//  Spirograph.metal
//  L-System-Studio
//
//  Created by Connor yass on 1/16/19.
//  Copyright © 2019 HSY_Technologies. All rights reserved.
//

#include <metal_stdlib>
#include <metal_math>

using namespace metal;

#include "../CBColorTools/Gradient/CBGradient.h"

struct VertexOut {
    float4 position [[ position ]];
    float pointsize [[ point_size ]];
    float3 color;
};

vertex VertexOut vertex_shader(const device float4 *verticies [[ buffer(0) ]],
                               const unsigned int i [[ vertex_id ]])
{
    VertexOut vert;
    vert.position = verticies[i];
    vert.color = float3(0,0,0);
    return vert;
}

fragment float4 fragment_shader(const VertexOut vert [[ stage_in ]]) {
    return float4(vert.color, 1.0);
}
