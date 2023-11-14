#version 330 compatibility

#include "/lib/settings.glsl"

uniform sampler2D colortex0;

in vec2 texcoord;

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 color;

void main() {
	color = texture(colortex0, texcoord);

	// piss color
	vec3 tint = vec3(1.0, 1.0, 0.7);
	// human vision coefficients
	vec3 grey = vec3(0.21, 0.72, 0.07);
	// get the fragment brightness
	float brightness = dot(color.rgb,grey);
	// finally, mix
	color.rgb = mix(color.rgb, tint, brightness); //mixes the screencolor with yellow with the exposure.

	// contrast
	color.rgb = pow(color.rgb, vec3(CONTRAST + 1.0));

	// exposure
	color.rgb *= 2.0;
	// tonemap
	color.rgb = color.rgb / (color.rgb + 1.0);
}