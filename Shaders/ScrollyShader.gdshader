shader_type canvas_item;

uniform float SPEED = 0.1;

void vertex() {
	UV.y -= TIME * SPEED;
}
