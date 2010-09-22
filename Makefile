LINK = ln -s 
MKDIR = mkdir -p
CP = cp
TARGET = $(HOME)
BASEDIR = $(CURDIR)

ignored_files = Makefile
default_filter_pattern = $(wildcard *~) $(wildcard .*) $(wildcard \#*\#) $(ignored_files)

non_linked_directory_names = emacs.d emacs.d/auto-save-list emacs.d/backups emacs.d/semanticdb
non_linked_file_names = 
all_non_linked_file_names = $(non_linked_file_names) $(non_linked_directory_names)
non_linked_filter_pattern = $(default_filter_pattern) $(all_non_linked_file_names)
all_recursively_linked_file_names = $(filter-out $(non_linked_filter_pattern),$(wildcard $(patsubst %,%/*,$(non_linked_directory_names))))

filtered_specific_files = $(all_recursively_linked_file_names) $(all_non_linked_file_names)
filtered_names = $(default_filter_pattern) $(filtered_specific_files)
all_file_names = $(filter-out $(filtered_names),$(wildcard *))

all_files = $(patsubst %,$(TARGET)/.%,$(all_file_names))
all_recursively_linked_files = $(patsubst %,$(TARGET)/.%,$(all_recursively_linked_file_names))
all_non_linked_directories = $(patsubst %,$(TARGET)/.%,$(non_linked_directory_names))
all_non_linked_files = $(patsubst %,$(TARGET)/.%,$(non_linked_file_names))

.PHONY: all
all: $(all_files) $(all_non_linked_directories) $(all_non_linked_files) $(all_recursively_linked_files)
	echo $(non_linked_directory_names)

$(filter $(TARGET)/.%, $(all_files)): $(TARGET)/.%: $(BASEDIR)/%
	-test -e $@ || $(LINK) $< $@;

$(filter $(TARGET)/.%, $(all_recursively_linked_files)): $(TARGET)/.%: $(BASEDIR)/%
	-test -e $@ || $(LINK) $< $@;

$(filter $(TARGET)/.%, $(all_non_linked_directories)): $(TARGET)/.%: $(BASEDIR)/%
	-test -d $@ || $(MKDIR) $@;

$(filter $(TARGET)/.%, $(all_non_linked_files)): $(TARGET)/.%: $(BASEDIR)/%
	-test -e $@ || $(CP) $< $@;
