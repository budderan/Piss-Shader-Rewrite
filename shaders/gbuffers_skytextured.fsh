#version 330 compatibility

uniform sampler2D gtexture;

in vec2 texcoord;
in vec4 glcolor;

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 color;

void main() {
	color = texture(gtexture, texcoord) * glcolor;
	
	// make the sun and moon brighter
    color.rgb *= 4.0;

	if (color.a < 0.1) {
		discard;
	}
}