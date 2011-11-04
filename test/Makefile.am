EXTRA_DIST = run gemset_create_test.rb gemset_list_test.rb test_helper.rb

RUBIES = ruby1.8 ruby1.9.1

check-local: $(patsubst %, check-%, $(RUBIES))

check-%:
	$* @abs_srcdir@/runtests.rb
	$(RM) -r @abs_srcdir@/.rbx
