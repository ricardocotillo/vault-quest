#version 460 core

#include <flutter/runtime_effect.glsl>

uniform vec2 uSize;
uniform vec3 uColor1;
uniform vec3 uColor2;

out vec4 fragColor;

float bayer4(vec2 p) {
    p = floor(mod(p, 4.0));
    float d = 0.0;
    if (p.y >= 2.0) { d += 8.0; p.y -= 2.0; }
    if (p.x >= 2.0) { d += 4.0; p.x -= 2.0; }
    if (p.y >= 1.0) { d += 2.0; p.y -= 1.0; }
    if (p.x >= 1.0) { d += 1.0; p.x -= 1.0; }
    return d / 16.0;
}

void main() {
    vec2 uv = FlutterFragCoord().xy / uSize;
    float l = uv.y; // Vertical gradient
    
    float threshold = bayer4(FlutterFragCoord().xy);
    vec3 finalColor = (l > threshold) ? uColor2 : uColor1;
    
    fragColor = vec4(finalColor, 1.0);
}
