# Use this for a native build on the Gumstix
#

CC = gcc
CFLAGS = -Wall

CXXFLAGS += `pkg-config opencv --cflags`
LDFLAGS += `pkg-config opencv --libs`

SRC = gumsnap.c
TARGET = gumsnap

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) $(CXXFLAGS) $(LDFLAGS) $(SRC) -o $(TARGET)

clean:
	rm -f $(TARGET)



