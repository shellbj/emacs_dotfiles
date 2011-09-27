LINK = ln -s 
TARGET = $(HOME)
BASEDIR = $(CURDIR)

ignored_files = . .. .git Makefile
all_file_names = $(filter-out $(ignored_files),$(wildcard .*)) $(filter-out $(ignored_files),$(wildcard *))
all_files = $(patsubst %,$(TARGET)/%,$(all_file_names))

.PHONY: all
all: $(all_files)

$(filter $(TARGET)/%, $(all_files)): $(TARGET)/%: $(BASEDIR)/%
	test -e $@ || $(LINK) $< $@;

clean:
	for file in $(all_files); do \
		test -L $$file && rm $$file; \
	done
