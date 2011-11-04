testdir = File.dirname(__FILE__)
$LOAD_PATH << testdir
Dir.glob(File.join(testdir, '*_test.rb')).each { |f| load f }
