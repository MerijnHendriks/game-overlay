TEMPLATE = lib

CONFIG -= qt

CharacterSet=1
DEFINES += _WIN32_WINNT=0x0601
DEFINES += _ENABLE_ATOMIC_ALIGNMENT_FIX

INCLUDEPATH += .
INCLUDEPATH += ../deps/3rd
INCLUDEPATH += ../deps/3rd/boost
INCLUDEPATH += ../deps/include
INCLUDEPATH += ../deps

CONFIG(debug, debug|release) {
    QMAKE_LIBDIR += ../deps/lib/debug
}
CONFIG(release, debug|release) {
    QMAKE_LIBDIR += ../deps/lib/release
}

OBJECTS_DIR = $(SolutionDir)Objdir/$(ProjectName)/$(Configuration)

DESTDIR = $(SolutionDir)/bin/$(Configuration)

PRECOMPILED_HEADER = stable.h

QMAKE_CFLAGS_RELEASE += /MT
QMAKE_CXXFLAGS_RELEASE += /MT
QMAKE_CFLAGS_DEBUG += /MTd
QMAKE_CXXFLAGS_DEBUG += /MTd

QMAKE_CXXFLAGS += /std:c++latest

contains(QMAKE_TARGET.arch, x86_64):{
message( "Building for 64 bit")

TARGET = $$join(TARGET,,,_x64)
LIBS += libMinHook.x64.lib
LIBS += corelib.x64.lib
}

!contains(QMAKE_TARGET.arch, x86_64):{
message( "Building for 32 bit")
LIBS += libMinHook.x86.lib
LIBS += corelib.x86.lib
}


HEADERS += dxgi1_2.h
HEADERS += geometry.h
SOURCES += ./main.cpp
HEADERS += ./common.hpp

HEADERS += ./message/gmessage.hpp

HEADERS += ./hook/apihook.hpp
HEADERS += ./hook/inputhook.h
SOURCES += ./hook/inputhook.cc

HEADERS += ./ipc/tinyipc.h
HEADERS += ./ipc/ipcmsg.h
HEADERS += ./ipc/ipclink.h
SOURCES += ./ipc/ipclink.cc
HEADERS += ./ipc/ipccenter.h
SOURCES += ./ipc/ipccenter.cc


HEADERS += ./overlay/session.h
SOURCES += ./overlay/session.cc

HEADERS += ./overlay/uiapp.h
SOURCES += ./overlay/uiapp.cc

HEADERS += ./overlay/hookapp.h
SOURCES += ./overlay/hookapp.cc

HEADERS += ./overlay/overlay.h
SOURCES += ./overlay/overlay.cc

HEADERS += ./hotkey/hotkeycheck.h

HEADERS += ./graphics/graphics.h

HEADERS += ./graphics/d3d9hook.h
SOURCES += ./graphics/d3d9hook.cc
HEADERS += ./graphics/dxgihook.h
SOURCES += ./graphics/dxgihook.cc

HEADERS += ./graphics/d3d9graphics.h
SOURCES += ./graphics/d3d9graphics.cc

HEADERS += ./graphics/dxgigraphics.h

HEADERS += ./graphics/d3d10graphics.h
SOURCES += ./graphics/d3d10graphics.cc

HEADERS += ./graphics/sprites.shader.h
HEADERS += ./graphics/d3d11sprite.h
SOURCES += ./graphics/d3d11sprite.cc
HEADERS += ./graphics/d3d11graphics.h
SOURCES += ./graphics/d3d11graphics.cc
HEADERS += ./graphics/d3d10sprite.h
SOURCES += ./graphics/d3d10sprite.cc
HEADERS += ./graphics/d3d10graphics.h
SOURCES += ./graphics/d3d10graphics.cc
