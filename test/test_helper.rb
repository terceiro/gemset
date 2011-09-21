require 'test/unit'
require 'fileutils'
require 'rbconfig'
require 'shoulda-context'
require 'tmpdir'
require 'rbconfig'

$GEMSET_SRCDIR = File.dirname(File.expand_path(File.dirname(__FILE__)))
ENV['PATH'] = [$GEMSET_SRCDIR, ENV['PATH']].join(':')

class GemsetTest < Test::Unit::TestCase

  SRCDIR = $GEMSET_SRCDIR

  def setup
    @tmpdir = Dir.mktmpdir
    @tmp_stdout = File.join(@tmpdir, 'tmp.out')
    @tmp_stderr = File.join(@tmpdir, 'tmp.err')

    ENV['HOME'] = @tmpdir
    @gem_home = `ruby -rubygems -e 'puts Gem.user_dir'`.strip

    # symlink current Ruby program into SRCDIR so that calling ruby from gemset
    # calls the current ruby
    ruby = File.join(RbConfig::CONFIG['bindir'], RbConfig::CONFIG['ruby_install_name'])
    FileUtils.ln_sf(ruby, File.join(SRCDIR, 'ruby'))
  end

  def teardown
    FileUtils.rm_r(File.join(SRCDIR, 'ruby'))
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

  def gemset_path(gemset)
    File.join(File.dirname(@gem_home), gemset)
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

  def assert_stderr_matches(regex)
    assert_match(regex, @stderr)
  end

  def assert_failure_exit_status
    assert @exit_status > 0, 'exit status expected to be > 0'
  end

end
