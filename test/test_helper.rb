require 'test/unit'
require 'fileutils'
require 'rbconfig'
require 'shoulda'

class GemsetTest < Test::Unit::TestCase

  GEMSET_ROOT = File.expand_path(File.dirname(__FILE__) + '/..')
  GEM_HOME = File.join(File.expand_path(File.dirname(__FILE__)), '/tmp', RbConfig::CONFIG['ruby_version'])
  GEM_HOME_PARENT = File.dirname(GEM_HOME)

  def setup
    ENV['GEM_HOME'] = GEM_HOME
  end

  def teardown
    FileUtils.rm_rf(GEM_HOME_PARENT)
    FileUtils.rm_rf('tmp.out')
    FileUtils.rm_rf('tmp.err')
  end

  def run(runner)
    return if @method_name.to_s == 'default_test'
    super
  end

  protected

  def gemset(*args)
    system("#{GEMSET_ROOT}/gemset #{args.join(' ')} >tmp.out 2>tmp.err")
    if $?.is_a?(Fixnum)
      @exit_status = $?
    else
      @exit_status = $?.exitstatus
    end
    @stdout = File.read('tmp.out')
    @stderr = File.read('tmp.err')
  end

  def assert_directory_exists(path)
    assert File.directory?(path), "No such directory: #{path}"
  end

  def assert_exit_status(code)
    assert_equal code, @exit_status
  end

  def assert_output_matches(regex)
    assert_match(regex, @stdout)
  end
end


