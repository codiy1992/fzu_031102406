# Microsoft Developer Studio Generated NMAKE File, Based on ���̼�¼.dsp
!IF $(CFG)" == "
CFG=���̼�¼ - Win32 Debug
!MESSAGE No configuration specified. Defaulting to ���̼�¼ - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "���̼�¼ - Win32 Release" && "$(CFG)" != "���̼�¼ - Win32 Debug"
!MESSAGE ָ�������� "$(CFG)" ��Ч.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "���̼�¼.mak" CFG="���̼�¼ - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "���̼�¼ - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "���̼�¼ - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF $(OS)" == "Windows_NT
NULL=
!ELSE 
NULL=nul
!ENDIF 

CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "���̼�¼ - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# ��ʼ�Զ����
OutDir=.\Release
# �����Զ����

ALL : "$(OUTDIR)\���̼�¼.exe"


CLEAN :
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\���̼�¼.obj"
	-@erase "$(OUTDIR)\���̼�¼.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /Fp"$(INTDIR)\���̼�¼.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\���̼�¼.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\���̼�¼.pdb" /machine:I386 /out:"$(OUTDIR)\���̼�¼.exe" 
LINK32_OBJS= \
	"$(INTDIR)\���̼�¼.obj"

"$(OUTDIR)\���̼�¼.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "���̼�¼ - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# ��ʼ�Զ����
OutDir=.\Debug
# �����Զ����

ALL : "$(OUTDIR)\���̼�¼.exe"


CLEAN :
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\���̼�¼.obj"
	-@erase "$(OUTDIR)\���̼�¼.exe"
	-@erase "$(OUTDIR)\���̼�¼.ilk"
	-@erase "$(OUTDIR)\���̼�¼.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /Fp"$(INTDIR)\���̼�¼.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\���̼�¼.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\���̼�¼.pdb" /debug /machine:I386 /out:"$(OUTDIR)\���̼�¼.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\���̼�¼.obj"

"$(OUTDIR)\���̼�¼.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("���̼�¼.dep")
!INCLUDE "���̼�¼.dep"
!ELSE 
!MESSAGE Warning: cannot find "���̼�¼.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "���̼�¼ - Win32 Release" || "$(CFG)" == "���̼�¼ - Win32 Debug"
SOURCE=".\���̼�¼.cpp"

"$(INTDIR)\���̼�¼.obj" : $(SOURCE) "$(INTDIR)"



!ENDIF 

