#include <windows.h>
#include "Angel.h"

//#define GLUT_DISABLE_ATEXIT_HACK

#include <gl\GLUT.H>


typedef Angel::vec4 color4;
typedef Angel::vec4 point4;

const int NumVertices = 36;

point4 points[NumVertices];
color4 colors[NumVertices];

point4 vertices[8] ={
	point4(-0.5,-0.5,0.5,1.0),//point4构造函数
	point4(-0.5,0.5,0.5,1.0),
	point4(0.5,0.5,0.5,1.0),
	point4(0.5,-0.5,0.5,1.0),
	point4(-0.5,-0.5,-0.5,1.0),
	point4(-0.5,0.5,-0.5,1.0),
	point4(0.5,0.5,-0.5,1.0),
	point4(0.5,-0.5,-0.5,1.0)
};

color4 vertex_colors[8]={
	color4(0.0,0.0,0.0,1.0),
	color4(1.0,0.0,0.0,1.0),
	color4(1.0,1.0,0.0,1.0),
	color4(0.0,1.0,0.0,1.0),
	color4(0.0,0.0,1.0,1.0),
	color4(1.0,0.0,1.0,1.0),
	color4(1.0,1.0,1.0,1.0),
	color4(0.0,1.0,1.0,1.0)
};

enum{Xaxis = 0,Yaxis = 1,Zaxis = 2,NumAxes = 3};//枚举类型

int Axis = Xaxis;

GLfloat Theta[NumAxes]={0.0,0.0,0.0};

GLuint theta;

int Index = 0;
void quad(int a,int b,int c,int d)
{
	colors[Index] = vertex_colors[a]; points[Index] = vertices[a];Index++;
	colors[Index] = vertex_colors[b]; points[Index] = vertices[b];Index++;
	colors[Index] = vertex_colors[c]; points[Index] = vertices[c];Index++;
	colors[Index] = vertex_colors[a]; points[Index] = vertices[a];Index++;
	colors[Index] = vertex_colors[c]; points[Index] = vertices[c];Index++;
	colors[Index] = vertex_colors[d]; points[Index] = vertices[d];Index++;
}

void colorcube()
{
	quad(1,0,3,2);
	quad(2,3,7,6);
	quad(3,0,4,7);
	quad(6,5,1,2);
	quad(4,5,6,7);
	quad(5,4,0,1);
}

void init()
{
	colorcube();
	GLuint program = InitShader("vshader36.glsl","fshader36.glsl");
	glUseProgram(program);
	
	GLuint vao;
	glGenVertexArrays(1,&vao);
	glBindVertexArray(vao);

	GLuint buffer;
	glGenBuffers(1,&buffer);
	glBindBuffer(GL_ARRAY_BUFFER,buffer);
	glBufferData(GL_ARRAY_BUFFER,sizeof(points)+sizeof(colors),NULL,GL_STATIC_DRAW);
	glBufferSubData(GL_ARRAY_BUFFER,0,sizeof(points),points);
	glBufferSubData(GL_ARRAY_BUFFER,sizeof(points),sizeof(colors),colors);
	
	GLuint vPosition = glGetAttribLocation(program,"vPosition");
	glEnableVertexAttribArray(vPosition);
	glVertexAttribPointer(vPosition,4,GL_FLOAT,GL_FALSE,0,BUFFER_OFFSET(0));

	GLuint vColor = glGetAttribLocation(program,"vColor");
	glEnableVertexAttribArray(vColor);
	glVertexAttribPointer(vColor,4,GL_FLOAT,GL_FALSE,0,BUFFER_OFFSET(sizeof(points)));

	theta = glGetUniformLocation(program,"theta");
	glEnable(GL_DEPTH_TEST);
	glClearColor(1.0,1.0,1.0,1.0);

}

void display()
{
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glUniform3fv(theta,1,Theta);
	glDrawArrays(GL_TRIANGLES,0,NumVertices);
	glutSwapBuffers(); 
}

void keyboard(unsigned char key,int x ,int y)
{
	switch(key)
	{
	case 033:
	case 'q':
	case 'Q':
		exit(EXIT_SUCCESS);
		break;
	}
}

void mouse(int button,int state,int x,int y)
{
	if(state == GLUT_DOWN)
	{
		switch(button)
		{
		case GLUT_LEFT_BUTTON:
			Axis = Xaxis;
			break;
		case GLUT_MIDDLE_BUTTON:
			Axis = Yaxis;
			break;
		case GLUT_RIGHT_BUTTON:
			Axis = Zaxis;
			break;
		}
	}
}

void idle()
{
	Theta[Axis] += 0.01;
	if(Theta[Axis] > 360.0)
	{
		Theta[Axis] -= 360.0;
	}
	glutPostRedisplay();
}

int WINAPI WinMain(HINSTANCE,HINSTANCE,PSTR,int)
{
	//glutInit(&argc,argv);
	glutInitDisplayMode(GLUT_RGBA | GLUT_DOUBLE | GLUT_DEPTH);
	glutInitWindowSize(512,512);
	glutCreateWindow("Color Cube");

	glewInit();
	init();
	glutDisplayFunc(display);
	glutKeyboardFunc(keyboard);
	glutMouseFunc(mouse);
	glutIdleFunc(idle);
	glutMainLoop();
	return 0;
}