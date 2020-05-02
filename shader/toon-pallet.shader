shader_type canvas_item;
uniform sampler2D pallet: hint_black;

void fragment()
{ 
	vec4 tex = texture(TEXTURE, UV);
	vec2 r = vec2(tex.r, 0);
	vec2 g = vec2(tex.g, 0);
	vec2 b = vec2(tex.b, 0);
	
	tex.r = texture(pallet, r).r;
	tex.g = texture(pallet, g).g;
	tex.b = texture(pallet, b).b;
	
	COLOR.rgb = tex.rgb; 
}
