# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{curb}
  s.version = "0.1.4"

  s.required_rubygems_version = nil if s.respond_to? :required_rubygems_version=
  s.authors = ["Ross Bamford"]
  s.cert_chain = nil
  s.date = %q{2007-08-08}
  s.description = %q{C-language Ruby bindings for the libcurl(3) URL transfer library.}
  s.email = %q{curb-devel@rubyforge.org}
  s.extensions = ["ext/extconf.rb"]
  s.extra_rdoc_files = ["ext/curb.c", "ext/curb_easy.c", "ext/curb_errors.c", "ext/curb_postfield.c", "ext/curb.rb", "README", "LICENSE"]
  s.files = ["ext/curl.rb", "ext/extconf.rb", "ext/curb.rb", "ext/curb.c", "ext/curb_easy.c", "ext/curb_errors.c", "ext/curb_postfield.c", "ext/curb_macros.h", "ext/curb_postfield.h", "ext/curb.h", "ext/curb_errors.h", "ext/curb_easy.h", "tests/bug_require_last_or_segfault.rb", "tests/tc_curl_easy.rb", "tests/helper.rb", "tests/alltests.rb", "tests/bug_instance_post_differs_from_class_post.rb", "tests/unittests.rb", "tests/tc_curl_postfield.rb", "tests/require_last_or_segfault_script.rb", "samples/gmail.rb", "doc.rb", "Rakefile", "README", "LICENSE"]
  s.has_rdoc = true
  s.homepage = %q{http://curb.rubyforge.org}
  s.rdoc_options = ["--title", "Curb API", "--main", "README"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new("> 0.0.0")
  s.rubyforge_project = %q{curb}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Ruby bindings for the libcurl(3) URL transfer library.}
  s.test_files = ["tests/tc_curl_easy.rb", "tests/tc_curl_postfield.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 1

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
