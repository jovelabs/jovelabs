def gem_dev(gem_name, *args)
  if (File.exists?(path = File.join("..", gem_name)) && (ENV["NOGEMDEV"] == "0"))
    if (arg = args.select{ |arg| arg.is_a?(Hash) }.first)
      arg.is_a?(Hash) && arg.reject!{ |k,v| [:git,:ref].include?(k) }.merge!(:path => path)
    else
      args << {:path => path}
    end
    gem_details = args.collect{ |arg| arg.inspect }.join(", "); !gem_details.empty? && (gem_details = ", #{gem_details}")
    puts("  GEMDEV: %24s%s" % [gem_name, gem_details])
  else
    gem_details = args.collect{ |arg| arg.inspect }.join(", "); !gem_details.empty? && (gem_details = ", #{gem_details}")
    puts("NOGEMDEV: %24s%s" % [gem_name, gem_details])
  end
  gem(gem_name, *args)
end

source 'https://rubygems.org'

gem_dev "ztk"

# Specify your gem's dependencies in jovelabs.gemspec
gemspec
