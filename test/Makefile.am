EXTRA_DIST = run gemset_create_test.rb gemset_list_test.rb test_helper.rb

RUBIES = ruby1.8 ruby1.9.1 rbx

check-local:
	for rubyprog in $(RUBIES); do \
		path=`which $$rubyprog` ;\
		if test -x $$path ; then \
			echo "********************************************************" ;\
			echo "* Running tests with $$rubyprog" ;\
			echo "********************************************************" ;\
			$$rubyprog -S rake -f @abs_srcdir@/run ;\
		fi \
	done
	$(RM) -r @abs_srcdir@/.rbx
