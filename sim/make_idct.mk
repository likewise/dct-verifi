PROJECT = idct
default: V$(PROJECT)__ALL.a
#
# Constants...
PERL = perl

# Switches...
VM_SP             = 0
VM_SC             = 1
VM_SP_OR_SC       = 1
VM_PCLI           = 0
VM_SC_TARGET_ARCH = linux64

# Vars...
VM_PREFIX       = V$(PROJECT)
VM_MODPREFIX    = V$(PROJECT)
VM_USER_CLASSES = \

VM_USER_DIR = \

CXXFLAGS += -g
CPPFLAGS += -I..
CPPFLAGS += -I.
CPPFLAGS += -I$(SYSTEMC_HOME)/include
CPPFLAGS += -I$(VERILATOR_ROOT)/include

OBJS     := $(wildcard *.o)
LIBFLAGS  = -L$(SYSTEMC_HOME)/lib-linux64

include V$(PROJECT)_classes.mk
include $(VERILATOR_ROOT)/include/verilated.mk

ver: verilated.o verilated_vcd_c.o verilated_vcd_sc.o

cppo:= $(foreach fl,$(wildcard ../../tb/$(PROJECT)/*.cpp),$(subst ../../tb/$(PROJECT)/, ,$(subst cpp,o,$(fl))))
obj: $(cppo)
.PHONY: cppo

$(cppo): %.o: ../tb/$(PROJECT)/%.cpp
	 $(OBJCACHE) $(CXX) $(CXXFLAGS) $(CPPFLAGS) -c -o $@ $<

fin:
	$(OBJCACHE) $(CXX) $(LIBFLAGS) $(OBJS) -o $(PROJECT) -lsystemc
	./$(PROJECT)

all: obj ver fin
