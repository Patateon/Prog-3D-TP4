#ifndef TEXTURE_H_DEFINED
#define TEXTURE_H_DEFINED

#include <string>
#include <vector>
#include <GL/glew.h>

GLuint loadTexture2DFromFilePath(const std::string& path);

GLuint loadTextureCubeMapFromFilePath(const std::vector<std::string> textures_faces);

void setDefaultTexture2DParameters(GLuint texture);

void setDefaultTextureCubeMapParameters(GLuint texture);

#endif
