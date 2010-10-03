dist_bin_SCRIPTS = gemset
EXTRA_DIST = \
	test/run \
	test/test_helper.rb \
	test/gemset_create_test.rb \
	test/gemset_list_test.rb \
	README.rst

man_MANS = gemset.1
CLEANFILES = $(man_MANS)

gemset.1: README.rst
	rst2man $< > $@

TESTS = test/run
