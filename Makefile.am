dist_bin_SCRIPTS = gemset
SUBDIRS = test
EXTRA_DIST = \
	README.rst

man_MANS = gemset.1
CLEANFILES = $(man_MANS)

gemset.1: README.pod
	pod2man $< > $@

distcheck-hook:
	for test_file in test/run test/*.rb; do test -e $(distdir)/$$test_file || (echo "ERROR: $$test_file not found in the distribution"; exit 1); done

test: check

.PHONY: test
