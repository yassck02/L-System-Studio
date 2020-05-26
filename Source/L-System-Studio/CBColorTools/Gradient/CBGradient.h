//
//  CBGradient.metal
//  L-System-Studio
//
//  Created by Connor yass on 5/5/20.
//  Copyright © 2020 Chinaberry Tech, LLC. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

#include "../Color/CBColor.h"

#ifndef CBGRADIENT_H
#define CBGRADIENT_H

/// Alias: CBGradient.Key
struct CBGradientKey {
    CBColor color;
    float location;
};

/// Returns the color at the given location in a gradient
CBColor colorForLocationInGradient(float location, const device CBGradientKey* gradient);

#endif
