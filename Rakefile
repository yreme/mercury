#!/usr/bin/env rake
<<<<<<< HEAD
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

# Dummy App
# -----------------------------------------------------------------------------
APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)
load 'rails/tasks/engine.rake'
Bundler::GemHelper.install_tasks

# Teabag
# -----------------------------------------------------------------------------
desc "Run javascript specs"
task :teabag => 'app:teabag'

# Cucumber
# -----------------------------------------------------------------------------
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:cucumber) do |t|
  # t.cucumber_opts = "features --format pretty"
end

# Mercury
# -----------------------------------------------------------------------------
namespace :mercury do
  require 'uglifier'
  require 'sprockets-rails'

  desc "Builds Mercury into the distribution ready package"
  task :build => ['build:dialogs', 'build:javascripts', 'build:stylesheets']

  namespace :build do

    desc "Combines all dialog and model views into a js file"
    task :dialogs => :environment do
      input = Mercury::Engine.root.join('app/views')
      File.open(Mercury::Engine.root.join('distro/javascripts/mercury_dialogs.js'), 'w') do |file|
        file.write "if (!window.Mercury) window.Mercury = {preloadedViews: {}};\n"
        %w[lightviews modals palettes panels selects].each do |path|
          file.write "// -- #{path.upcase} --\n"
          Dir[input.join('mercury', path, '*.html')].sort.each do |filename|
            file.write %Q{Mercury.preloadedViews['#{filename.gsub(input.to_s, '')}'] = "}
            File.foreach(filename) { |line| file.write line.chomp.gsub('"', '\\"') }
            file.write %Q{";\n}
          end
        end
      end
    end

    desc "Combine javascripts into mercury.js and mercury.min.js"
    task :javascripts => :environment do
      env    = Rails.application.assets
      target = Pathname.new(File.join(Mercury::Engine.root.join('distro'), 'build'))
      manifest = {}

      ['mercury.js', 'mercury/mercury.js'].each do |path|
        env.each_logical_path do |logical_path|
          if path.is_a?(Regexp)
            next unless path.match(logical_path)
          else
            next unless File.fnmatch(path.to_s, logical_path)
          end

          if asset = env.find_asset(logical_path)
            manifest[logical_path] = asset.digest_path
            filename = target.join(asset.digest_path)
            mkdir_p filename.dirname
            asset.write_to(filename)
          end
        end
      end

      Dir[Mercury::Engine.root.join('distro/build/mercury-*.js')].each do |filename|
        copy_file(filename, Mercury::Engine.root.join('distro/javascripts/mercury.js'))
        copy_file(filename, Mercury::Engine.root.join('app/assets/javascripts/mercury/mercury-compiled.js'))
        remove(filename)
      end

      Dir[Mercury::Engine.root.join('distro/build/mercury/mercury-*.js')].each do |filename|
        copy_file(filename, Mercury::Engine.root.join('distro/javascripts/mercury.min.js'))
        remove(filename)
        minified = '' #Uglifier.compile(File.read(Mercury::Engine.root.join('app/assets/javascripts/mercury/dependencies/jquery-1.7.js')))
        minified += Uglifier.compile(File.read(Mercury::Engine.root.join('distro/javascripts/mercury.min.js')))
        File.open(Mercury::Engine.root.join('distro/javascripts/mercury.min.js'), 'w') do |file|
          file.write(File.read(Mercury::Engine.root.join('app/assets/javascripts/mercury.js')))
          file.write(minified)
        end
      end

      #copy_file(Mercury::Engine.root.join('app/assets/javascripts/mercury_loader.js'), Mercury::Engine.root.join('distro/javascripts/mercury_loader.js'))
    end

    desc "Combine stylesheets into mercury.css and mercury.bundle.css (bundling images where possible)"
    task :stylesheets => :environment do
      env    = Rails.application.assets
      target = Pathname.new(File.join(Mercury::Engine.root.join('distro'), 'build'))
      manifest = {}

      ['mercury.css'].each do |path|
        env.each_logical_path do |logical_path|
          if path.is_a?(Regexp)
            next unless path.match(logical_path)
          else
            next unless File.fnmatch(path.to_s, logical_path)
          end

          if asset = env.find_asset(logical_path)
            manifest[logical_path] = asset.digest_path
            filename = target.join(asset.digest_path)
            mkdir_p filename.dirname
            asset.write_to(filename)
          end
        end
      end

      Dir[Mercury::Engine.root.join('distro/build/mercury-*.css')].each do |filename|
        copy_file(filename, Mercury::Engine.root.join('distro/stylesheets/mercury.css'))
        remove(filename)
      end

      bundled = File.read(Mercury::Engine.root.join('distro/stylesheets/mercury.css'))

      # import image files using: url(data:image/gif;base64,XEQA7)
      bundled.gsub!(/url\(\/assets\/(.*?)\)/ix) do |m|
        encoded = Base64.encode64(File.read(Mercury::Engine.root.join('app/assets/images', $1))).gsub("\n", '')
        "url(data:image/png;base64,#{encoded})"
      end

      # remove comments (only /* */ style)
      bundled.gsub!(/\/\*[^!].*?\*\//m, '')

      # remove whitespace
      bundled.gsub!(/\s+/, ' ')

      # put a few line breaks back in
      bundled.gsub!(/\}/, "}\n")
      bundled.gsub!(/ \*/, "\n *")
      bundled.gsub!(/ \*\//, " */\n")

      File.open(Mercury::Engine.root.join('distro/stylesheets/mercury.bundle.css'), 'wb') do |file|
        file.write(bundled)
      end
    end

  end
end


# Default
# -----------------------------------------------------------------------------
#Rake::Task['default'].prerequisites.clear
#Rake::Task['default'].clear

task :default => [:teabag]
=======
load File.expand_path('../config.ru', __FILE__)

Mercury::Application.load_tasks

desc "Builds assets into the distribution ready bundle"
task :build => ['build:javascripts', 'build:stylesheets', 'build:fonts', 'build:assets'] do
  puts 'Done building'
end

namespace :build do
  env          = Rails.application.assets
  output_path  = Rails.root.join('distro')
  asset_paths  = ['fonts/*']
  fontcustom   = ['mercury-icons.yml']
  stylesheets  = ['mercury.css', 'mercury_regions.css']
  javascripts  = {
    dependencies: 'mercury/dependencies.js',
    locales:      'mercury/locales.js',
    regions:      'mercury/regions.js',
    base:         'mercury/mercury.js',
    config:       'mercury/config.js'
  }

  desc "Compile coffeescripts into javascripts"
  task :javascripts => :environment do
    puts 'Building javascripts...'

    config = env.find_asset(javascripts[:config])
    base = env.find_asset(javascripts[:base])

    FileUtils.mkdir_p(output_path)

    # base javascripts and configuration
    puts "  base: mercury.js"
    File.open(output_path.join('mercury.js'), 'w') do |file|
      file.write(config.source)
      file.write(base.source)
    end

    # minified base javascripts and not minified configuration
    puts "  base: mercury.min.js"
    File.open(output_path.join('mercury.min.js'), 'w') do |file|
      file.write(config.source)
      file.write(Uglifier.compile(base.source, squeeze: true))
    end

    # write dependencies
    env.find_asset(javascripts[:dependencies]).send(:required_assets).each do |asset|
      filename = File.basename(asset.logical_path)
      next if filename == 'dependencies.js'
      puts "  dependency: #{filename}"

      asset.write_to(output_path.join('dependencies', filename))
    end

    # write locales
    env.find_asset(javascripts[:locales]).send(:required_assets).each do |asset|
      filename = File.basename(asset.logical_path)
      next if filename == 'locales.js'
      puts "  locale: #{filename}"

      asset.write_to(output_path.join('locales', filename))
    end

    # write regions
    regions = []
    env.find_asset(javascripts[:regions]).send(:required_assets).each do |asset|
      filename = File.basename(asset.logical_path)
      next if filename == 'regions.js'
      next unless asset.logical_path =~ /^mercury/
      puts "  region: #{filename}"
      regions << asset

      Rails.application.config.assets.debug = false
      asset = env.find_asset(asset.logical_path)
      asset.write_to(output_path.join('regions', filename))
      Rails.application.config.assets.debug = true

      File.open(output_path.join('regions', filename.gsub(/\.js$/, '.min.js')), 'w') do |file|
        file.write(Uglifier.compile(asset.source, squeeze: true))
      end
    end

    # bundled javascript (base, config, and regions without dependencies)
    #puts "  base: mercury.bundle.js"
    #File.open(output_path.join('mercury.bundle.js'), 'w') do |file|
    #  file.write(config.source)
    #  file.write(base.source)
    #  for region in regions
    #    file.write(region.source)
    #  end
    #end
  end

  desc "Compile sass files into css"
  task :stylesheets => :environment do
    puts 'Building stylesheets...'

    stylesheets.each do |path|
      puts "  base: #{path}"
      asset = env.find_asset(path)
      asset.write_to(output_path.join(path))

      # add base64 encoded image/font urls
      processed = asset.source.gsub(/url\(\/assets\/mercury\/(.*?)\)/ix) do |m|
        format = 'image/png'
        file = Rails.root.join('lib/images/mercury', $1)
        unless File.exists?(file)
          format = 'font/ttf'
          file = Rails.root.join('lib/fonts/mercury', $1)
        end
        encoded = Base64.encode64(File.read(file)).gsub("\n", '')
        "url(data:#{format};base64,#{encoded})"
      end

      # minimized css with a few line breaks added in
      minified = YUI::CssCompressor.new.compress(processed).gsub!(/\}/, "}\n")
      minified.gsub!("}\nfrom", '}from')
      minified.gsub!("}\n}", '}}')
      minified.gsub!('*/', "*/\n")
      File.open(output_path.join(path.gsub('.css', '.bundle.css')), 'w') do |file|
        file.write(minified)
      end
    end
  end

  desc "Build svg images into fonts"
  task :fonts => :environment do
    puts 'Building fonts...'

    fontcustom.each do |config|
      puts "  fontcustom: #{config}"
      `fontcustom compile --config lib/fonts/glyphs/#{config}`
    end
  end

  desc "Copy asset files into distro"
  task :assets => :environment do
    puts 'Copying assets...'

    FileUtils.mkdir_p(output_path.join('assets'))
    for path in asset_paths
      for file in Dir[Rails.root.join('lib', path)]
        puts "  #{File.directory?(file) ? 'path' : 'file'}: #{File.basename(file)}"
        FileUtils.cp_r file, output_path.join('assets')
      end
    end
  end
end

task :default => [:teaspoon, 'build']
>>>>>>> 95e6decf9fd1b2a7f705e45b64c210e86cd2c885
