#version 330 core

in vec3 o_positionWorld;
in vec3 o_normalWorld;
in vec2 o_uv0;
in mat3 o_tbn;
out vec4 FragColor;

uniform vec4 color;
uniform vec3 camPos;
uniform vec3 lightPos;

uniform sampler2D colorTexture;
uniform sampler2D normalMap;



void main() {
    //FragColor = color;
    // FragColor = texture(colorTexture, o_uv0) * color;
    // FragColor = texture(colorTexture, o_uv0) * color;
    // FragColor = texture(normalMap, o_uv0);
    // DEBUG: position
    //FragColor = vec4(o_positionWorld, 1.0);
    // DEBUG: normal
    // FragColor = vec4(0.5 * o_normalWorld + vec3(0.5) , 1.0);
    // DEBUG: uv0
    // FragColor = vec4(o_uv0, 1.0);
    // normal = normal * 0.5 + vec3(0.5);

    vec3 normal = o_tbn * (2. * texture(normalMap, o_uv0).rgb - vec3(1.0));

    vec3 lightColor = color.rgb;
    // Ambient
    float ambientStrength = 0.1;
    vec3 ambient = ambientStrength * lightColor;

    // Diffuse
    float diffuseStrength = 1.;
    vec3 norm = normalize(normal);
    vec3 lightDir = normalize(lightPos - o_positionWorld);
    float diff = max(dot(norm, lightDir), 0.0);
    vec3 diffuse = diffuseStrength * diff * lightColor;

    // Specular
    float specularStrength = 1.0;
    vec3 viewDir = normalize(camPos - o_positionWorld);
    vec3 reflectDir = reflect(-lightDir, norm);
    float spec = pow(max(dot(viewDir, reflectDir), 0.0), 160);
    vec3 specular = specularStrength * spec * lightColor;

    vec3 result = ((ambient + diffuse) * texture(colorTexture, o_uv0).rgb) + specular;



    FragColor =  vec4(result, 1.0);
}
