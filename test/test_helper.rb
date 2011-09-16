require 'test/unit'
require 'fileutils'
require 'rbconfig'
require 'shoulda-context'
require 'tmpdir'

class GemsetTest < Test::Unit::TestCase

  SRCDIR = File.dirname(File.expand_path(File.dirname(__FILE__)))

  def setup
    @tmpdir = Dir.mktmpdir
    @gem_home = File.join(@tmpdir, 'gems', RbConfig::CONFIG['ruby_version'])
    @tmp_stdout = File.join(@tmpdir, 'tmp.out')
    @tmp_stderr = File.join(@tmpdir, 'tmp.err')

    ENV['GEM_HOME'] = @gem_home
  end

  def teardown
    FileUtils.rm_rf(@tmpdir)
  end

  def run(runner)
    return if @method_name.to_s == 'default_test'
    super
  end

  protected

  def gemset(*args)
    system("#{SRCDIR}/gemset #{args.join(' ')} >#{@tmp_stdout} 2>#{@tmp_stderr}")
    if $?.is_a?(Fixnum)
      @exit_status = $?
    else
      @exit_status = $?.exitstatus
    end
    @stdout = File.read(@tmp_stdout)
    @stderr = File.read(@tmp_stderr)
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

  def assert_failure_exit_status
    assert @exit_status > 0, 'exit status expected to be > 0'
  end

end
