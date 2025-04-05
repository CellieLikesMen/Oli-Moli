# Compiler and flags
CC = gcc
WINDRES = windres
CFLAGS = -Wall -mwindows -IC:/msys64/mingw64/include/gtk-3.0 -IC:/msys64/mingw64/include/glib-2.0 -IC:/msys64/mingw64/lib/glib-2.0/include -IC:/msys64/mingw64/include/pango-1.0 -IC:/msys64/mingw64/include/harfbuzz -IC:/msys64/mingw64/include/cairo -IC:/msys64/mingw64/include/gdk-pixbuf-2.0 -IC:/msys64/mingw64/include/atk-1.0
LDFLAGS = -LC:/msys64/mingw64/lib -lgtk-3 -lgdk-3 -lgdi32 -limm32 -lshell32 -lole32 -lglib-2.0 -lgobject-2.0 -lharfbuzz -lgdk_pixbuf-2.0

# Source files
SRCS = main.c ui_components.c
OBJS = $(SRCS:.c=.o)
RESOURCES = resource.o

# Target
TARGET = olimoli.exe

# Default target
all: $(TARGET)

# Compile source files
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Compile resource file
resource.o: resource.rc
	$(WINDRES) -i $< -o $@

# Link object files
$(TARGET): $(OBJS) $(RESOURCES)
	$(CC) $(OBJS) $(RESOURCES) -o $(TARGET) $(LDFLAGS)

# Clean up
clean:
	rm -f $(OBJS) $(RESOURCES) $(TARGET)

# Run the program
run: $(TARGET)
	.\$(TARGET)

.PHONY: all clean run 