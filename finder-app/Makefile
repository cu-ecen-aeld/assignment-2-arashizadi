CROSS_COMPILE ?=
CC := $(CROSS_COMPILE)gcc

SRC := writer.c
TARGET := writer
OBJS := $(SRC:.c=.o)

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(INCLUDES) $(OBJS) -o $@ $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	-rm -f $(OBJS) $(TARGET) *.elf *.map
