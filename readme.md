# Forums engine for Refinery CMS.

## How to build this engine as a gem

    cd vendor/engines/forums
    gem build refinerycms-forums.gempspec
    gem install refinerycms-forums.gem
    
    # Sign up for a http://rubygems.org/ account and publish the gem
    gem push refinerycms-forums.gem