/*
hw3.cpp
  */

#include <GL/glut.h>

const GLfloat table_width = 350.0, table_depth = 250.0,
              table_thickness = 15.0,
			  table_leg_height = 150.0, table_leg_thickness = 30.0;

void init(void) 
{
   GLfloat ambient[] = {0.0, 0.0, 0.0, 1.0};
   GLfloat diffuse[] = {1.0, 1.0, 1.0, 1.0};
   GLfloat specular[] = {1.0, 1.0, 1.0, 1.0};
   GLfloat position[] = {0.0, 3.0, 3.0, 0.0};

   GLfloat lmodel_ambient[] = {0.2, 0.2, 0.2, 1.0};
   GLfloat local_view[] = {0.0};

   glEnable(GL_LIGHTING);
   glEnable(GL_LIGHT0);

   glLightfv(GL_LIGHT0, GL_AMBIENT, ambient);
   glLightfv(GL_LIGHT0, GL_DIFFUSE, diffuse);
   glLightfv(GL_LIGHT0, GL_POSITION, position);
   glLightModelfv(GL_LIGHT_MODEL_AMBIENT, lmodel_ambient);
   glLightModelfv(GL_LIGHT_MODEL_LOCAL_VIEWER, local_view);

   glEnable(GL_AUTO_NORMAL);
   glEnable(GL_NORMALIZE);
   glEnable(GL_DEPTH_TEST); 
}

void SetMaterial (
   GLfloat ambr, GLfloat ambg, GLfloat ambb,		// ambient
   GLfloat difr, GLfloat difg, GLfloat difb,		// diffuse
   GLfloat specr, GLfloat specg, GLfloat specb,		// specular
   GLfloat shine)									// shiness
{
   GLfloat mat[4];

   mat[0] = ambr; mat[1] = ambg; mat[2] = ambb; mat[3] = 1.0;
   glMaterialfv(GL_FRONT, GL_AMBIENT, mat);
   mat[0] = difr; mat[1] = difg; mat[2] = difb;
   glMaterialfv(GL_FRONT, GL_DIFFUSE, mat);
   mat[0] = specr; mat[1] = specg; mat[2] = specb;
   glMaterialfv(GL_FRONT, GL_SPECULAR, mat);
   glMaterialf(GL_FRONT, GL_SHININESS, shine * 128.0);
}


void display(void)
{
   glClear (GL_COLOR_BUFFER_BIT| GL_DEPTH_BUFFER_BIT);
   glColor3f (1.0, 1.0, 1.0);

   glLoadIdentity ();             /* clear the matrix */

   /* viewing transformation  */
 //  gluLookAt (0.0, 0.0, 350.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);
   gluLookAt (0.0, 150.0, 500.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);



   /* Table Top */ 
   // table top mateial
   SetMaterial(0.24725, 0.1995, 0.0745,
	           0.75164, 0.60648, 0.22648,
			   0.628281, 0.555802, 0.366065,
			   0.4);
   glPushMatrix();
   glTranslatef(0, -table_thickness/2.0, 0);
   glScalef(table_width, table_thickness, table_depth);
   glutSolidCube(1.0);
   glPopMatrix();


   // table leg mateial
   SetMaterial(0.2125, 0.1275, 0.054,
	           0.714, 0.4284, 0.18144,
			   0.393548, 0.271906, 0.166721,
			   0.2);

   /* Table Leg 1 */
   glPushMatrix();
   glTranslatef ((table_width-table_leg_thickness)/2.0,
	             -table_leg_height/2.0-table_thickness,
				 (table_depth-table_leg_thickness)/2.0);
   glScalef(table_leg_thickness, table_leg_height, table_leg_thickness);
   glutSolidCube(1.0);
   glPopMatrix();

   /* Table Leg 2 */
   glPushMatrix();
   glTranslatef (-(table_width-table_leg_thickness)/2.0,
	             -table_leg_height/2.0-table_thickness,
				 (table_depth-table_leg_thickness)/2.0);
   glScalef(table_leg_thickness, table_leg_height, table_leg_thickness);
   glutSolidCube(1.0);
   glPopMatrix();

   glFlush ();
}

void reshape (int w, int h)
{
   glViewport (0, 0, (GLsizei) w, (GLsizei) h); 
   glMatrixMode (GL_PROJECTION);
   glLoadIdentity ();
   glFrustum (-100.0, 100.0, -100.0, 100.0, 200.0, 1000.0);
// glOrtho (-100.0, 100.0, -100.0, 100.0, 10.0, 600.0);
   glMatrixMode (GL_MODELVIEW);
}

/* ARGSUSED1 */
void keyboard(unsigned char key, int x, int y)
{
   switch (key) {
      case 27:
         exit(0);
         break;
   }
}

int main(int argc, char** argv)
{
   glutInit(&argc, argv);
   glutInitDisplayMode (GLUT_SINGLE | GLUT_RGB | GLUT_DEPTH);
   glutInitWindowSize (500, 500); 
   glutInitWindowPosition (100, 100);
   glutCreateWindow (argv[0]);
   init ();
   glutDisplayFunc(display); 
   glutReshapeFunc(reshape);
   glutKeyboardFunc(keyboard);
   glutMainLoop();
   return 0;
}
