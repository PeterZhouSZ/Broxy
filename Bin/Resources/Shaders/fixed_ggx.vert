/*
	Copyright (c) 2015-2017 Telecom ParisTech (France).
	Authors: Stephane Calderon and Tamy Boubekeur.
	All rights reserved.

	This file is part of Broxy, the reference implementation for
	the paper:
		Bounding Proxies for Shape Approximation.
		Stephane Calderon and Tamy Boubekeur.
		ACM Transactions on Graphics (Proc. SIGGRAPH 2017),
		vol. 36, no. 5, art. 57, 2017.

	You can redistribute it and/or modify it under the terms of the GNU
	General Public License as published by the Free Software Foundation,
	either version 3 of the License, or (at your option) any later version.

	Licensees holding a valid commercial license may use this file in
	accordance with the commercial license agreement provided with the software.

	This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
	WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
*/


#version 140
uniform mat4 cameraViewMatrix;
uniform mat4 cameraNormalMatrix;
uniform mat4 cameraProjectionMatrix;

in vec3 position;
in vec3 normal;

out vec4 P;
out vec3 N;
out vec4 C;

void main(void) {
    P = vec4 (position, 1.0);
    vec4 n4 = cameraNormalMatrix * vec4 (normal, 1.0);
    N = n4.xyz;
    C = vec4 (1.0, 1.0, 1.0, 1.0);
    gl_Position = cameraProjectionMatrix * cameraViewMatrix * P;
}
