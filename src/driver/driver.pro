TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle                 # Не собирать маковский архив
CONFIG -= qt
QT -= gui
QT -= core
DESTDIR = ../../bin                  # Папка с бинарниками проекта
OBJECTS_DIR = ../../build-driver     # Путь объектников
MOC_DIR = ../..//build-driver        # Путь моков
RCC_DIR = ../../build-driver         # Путь ресорцов
TARGET = driver

INSTALL.path = $$DESTDIR             # Куда копируем

win32 {
    # Путь до библиотеки SDL:
    # SDL2_PATH = "../../lib/win/SDL2-2.26.4/i686-w64-mingw32"

    # Копируем dll файл библиотеки SDL в папку бинарниками
    INSTALL.files  += $${SDL2_PATH}\bin\SDL2.dll
    # Копируем скрипт запуска приложения
    INSTALL.files  += $$PWD/run_with_viewer.cmd

    # Путь до библиотеки IPC:
    # IPC_LIB_PATH = "../../lib/win/ipc_lib/usr"
}

win64 {
    # Путь до библиотеки SDL:
    # SDL2_PATH = "../../lib/win/SDL2-2.26.4/x86_64-w64-mingw32"

    # Копируем dll файл библиотеки SDL в папку бинарниками
    INSTALL.files  += $${SDL2_PATH}\bin\SDL2.dll
    # Копируем скрипт запуска приложения
    INSTALL.files  += $$PWD/run_with_viewer.cmd

    # Путь до библиотеки IPC:
    # IPC_LIB_PATH =
}

linux-g++ {
    QMAKE_LFLAGS += -Wl,-rpath,.     # Использовать библиотеки в папке с программой
    # Путь до библиотеки SDL:
    # SDL2_PATH =

    # Копируем скрипт запуска и остановки приложения
    INSTALL.files  += $$PWD/run_with_viewer.sh
    INSTALL.files  += $$PWD/stop_all.sh

    # Путь до библиотеки IPC:
    # IPC_LIB_PATH = "../../lib/linux/ipc_lib/usr"
}

INCLUDEPATH += \
    $${SDL2_PATH}/include \
    $${IPC_LIB_PATH}/include

SOURCES += \
    command.cpp \
    commands.cpp \
    commandshandler.cpp \
    gamepad.cpp \
    main.cpp \
    application.cpp \
    sender.cpp


HEADERS += \
    command.h \
    commands.h \
    commandshandler.h \
    messages.h \
    application.h \
    gamepad.h \
    motion.h \
    sender.h

LIBS += \
    -L$${SDL2_PATH}/lib -lSDL2 -lSDL2main \
    -L$${IPC_LIB_PATH}/lib -lipc

INSTALL.files  += $${IPC_LIB_PATH}/lib/*      # Что копируем
INSTALL.files  += $$PWD/../../load            # Директория с настройками
INSTALL.files  += $$PWD/gamecontrollerdb.txt  # Список привязок различных контроллеров для SDL
INSTALLS       += INSTALL                     # Добавляем к установке свои копирования
