#version 330 core

layout(location = 0) in vec3 positionCubeMap;

uniform mat4 view;
uniform mat4 projection;

out vec3 o_texCoord;


void main() {

    o_texCoord = positionCubeMap;

    gl_Position = projection * view * vec4(positionCubeMap, 1.0);
}
