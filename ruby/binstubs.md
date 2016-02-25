awesome!

https://github.com/sstephenson/rbenv/wiki/Understanding-binstubs

MAY hack bad code to look for a Gemfile in ../

```
require 'pathname'
gemfile = File.expand_path("../../Gemfile", Pathname.new(__FILE__).realpath) 
if File.exists?( gemfile ) 
  ENV['BUNDLE_GEMFILE'] ||= gemfile 
  require 'rubygems'
  require 'bundler/setup'
end
```

quite wonderful!
