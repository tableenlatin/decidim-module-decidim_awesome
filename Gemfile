# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

decidim_version = ENV.fetch("DECIDIM_VERSION", ">= 0.32.0.rc2")
decidim_upper_bound = "< 0.33"
decidim_path = ENV["DECIDIM_PATH"].to_s.empty? ? nil : ENV["DECIDIM_PATH"]
module_path = File.basename(__dir__) == "development_app" ? ".." : "."

if decidim_path
  gem "decidim", path: decidim_path
  gem "decidim-conferences", path: "#{decidim_path}/decidim-conferences"
  gem "decidim-initiatives", path: "#{decidim_path}/decidim-initiatives"
  gem "decidim-templates", path: "#{decidim_path}/decidim-templates"
else
  gem "decidim", decidim_version, decidim_upper_bound
  gem "decidim-conferences", decidim_version, decidim_upper_bound
  gem "decidim-initiatives", decidim_version, decidim_upper_bound
  gem "decidim-templates", decidim_version, decidim_upper_bound
end

gem "decidim-decidim_awesome", path: module_path

gem "bootsnap", "~> 1.23"

gem "puma", ">= 6.3.1"
gem "rexml", "~> 3.4", ">= 3.4.4"

group :development, :test do
  gem "byebug", "~> 13.0", platform: :mri

  if decidim_path
    gem "decidim-dev", path: decidim_path
  else
    gem "decidim-dev", decidim_version, decidim_upper_bound
  end

  gem "brakeman", "~> 8.0"
  gem "parallel_tests", "~> 5.6"
  gem "rubocop-rails", "~> 2.34"
end

group :development do
  gem "letter_opener_web", "~> 3.0"
  gem "listen", "~> 3.10"
  gem "web-console", "~> 4.3"
end
