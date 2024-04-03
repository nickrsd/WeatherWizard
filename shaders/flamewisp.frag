#version 460 core

#include <flutter/runtime_effect.glsl>

out vec4 fragColor;

uniform float time;       // A time value, for animating the flame.
uniform vec2 resolution;  // The resolution of the canvas.

// Simple noise function for illustration
float noise(vec2 st) {
    return fract(sin(dot(st.xy, vec2(12.9898,78.233))) * 43758.5453123);
}

void main() {
    vec2 st = FlutterFragCoord().xy / resolution.xy;
    st.x *= resolution.x / resolution.y; // Correct aspect ratio

    // Time varying pixel color
    vec3 color = vec3(0.0);

    // Add some noise based on our time
    float n = noise(st - time * 0.1);

    // Use the noise value to perturb the space (coordinate)
    st += n - 0.5;

    // Create a color using the perturbed space
    color = mix(vec3(1.0, 0.5, 0.0), vec3(0.9, 0.0, 0.0), st.y + n * 0.5);
    float alpha = 0.6 - st.y * (1.0 - st.y);

    // Apply noise to alpha for a flickering effect
    alpha *= (n * 0.5 + 0.5);

    fragColor = vec4(color, alpha);
}