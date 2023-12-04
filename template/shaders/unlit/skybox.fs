#version 330 core

out vec4 FragColor;

in vec3 o_texCoord;

uniform samplerCube cubeMap;

void main() {
    FragColor = texture(cubeMap, o_texCoord);
}
