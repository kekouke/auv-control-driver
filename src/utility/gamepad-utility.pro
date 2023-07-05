QT += quick qml
CONFIG += c++11
DESTDIR = ../../bin                          # Папка с бинарниками проекта
OBJECTS_DIR = ../../build-utility            # Путь объектников
MOC_DIR = ../../build-utility                # Путь моков
RCC_DIR = ../../build-utility                # Путь ресорцов
TARGET  = driver-utility

win32 {
    # Путь до библиотеки SDL:
    # SDL2_PATH = "../../lib/win/SDL2-2.26.4/i686-w64-mingw32"
}

win64 {
    # Путь до библиотеки SDL:
    # SDL2_PATH = "../../lib/win/SDL2-2.26.4/x86_64-w64-mingw32"
}

linux-g++ {
    # Путь до библиотеки SDL:
    # SDL2_PATH =
}

INCLUDEPATH += \
    $${SDL2_PATH}/include \

LIBS += \
    -L$${SDL2_PATH}/lib -lSDL2 -lSDL2main

SOURCES += \
        controller.cpp \
        gamepad.cpp \
        main.cpp

RESOURCES += qml.qrc

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    command.h \
    controller.h \
    gamepad.h
