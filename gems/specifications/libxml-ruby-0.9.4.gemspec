# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{libxml-ruby}
  s.version = "0.9.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Charlie Savage"]
  s.date = %q{2008-11-24}
  s.description = %q{The Libxml-Ruby project provides Ruby language bindings for the GNOME Libxml2 XML toolkit. It is free software, released under the MIT License. Libxml-ruby's primary advantage over REXML is performance - if speed  is your need, these are good libraries to consider, as demonstrated by the informal benchmark below.}
  s.email = %q{libxml-devel@rubyforge.org}
  s.extensions = ["ext/libxml/extconf.rb"]
  s.files = ["Rakefile", "README", "LICENSE", "CHANGES", "setup.rb", "doc/css", "doc/css/normal.css", "doc/img", "doc/img/raze-tiny.png", "doc/img/red-cube.jpg", "doc/img/xml-ruby.png", "doc/index.xml", "doc/install.xml", "doc/layout.rhtml", "doc/layout.xsl", "doc/license.xml", "doc/log", "doc/log/changelog.xml", "doc/log/changelog.xsl", "ext/libxml/cbg.c", "ext/libxml/extconf.rb", "ext/libxml/libxml.c", "ext/libxml/libxml.c.rej", "ext/libxml/ruby_libxml.h", "ext/libxml/ruby_xml_attr.c", "ext/libxml/ruby_xml_attr.h", "ext/libxml/ruby_xml_attributes.c", "ext/libxml/ruby_xml_attributes.h", "ext/libxml/ruby_xml_document.c", "ext/libxml/ruby_xml_document.h", "ext/libxml/ruby_xml_dtd.c", "ext/libxml/ruby_xml_dtd.h", "ext/libxml/ruby_xml_error.c", "ext/libxml/ruby_xml_error.h", "ext/libxml/ruby_xml_html_parser.c", "ext/libxml/ruby_xml_html_parser.h", "ext/libxml/ruby_xml_input.c", "ext/libxml/ruby_xml_input.h", "ext/libxml/ruby_xml_input_cbg.c", "ext/libxml/ruby_xml_input_cbg.h", "ext/libxml/ruby_xml_node.c", "ext/libxml/ruby_xml_node.h", "ext/libxml/ruby_xml_ns.c", "ext/libxml/ruby_xml_ns.h", "ext/libxml/ruby_xml_parser.c", "ext/libxml/ruby_xml_parser.h", "ext/libxml/ruby_xml_parser_context.c", "ext/libxml/ruby_xml_parser_context.h", "ext/libxml/ruby_xml_reader.c", "ext/libxml/ruby_xml_reader.h", "ext/libxml/ruby_xml_relaxng.c", "ext/libxml/ruby_xml_relaxng.h", "ext/libxml/ruby_xml_sax_parser.c", "ext/libxml/ruby_xml_sax_parser.h", "ext/libxml/ruby_xml_schema.c", "ext/libxml/ruby_xml_schema.h", "ext/libxml/ruby_xml_state.c", "ext/libxml/ruby_xml_state.h", "ext/libxml/ruby_xml_xinclude.c", "ext/libxml/ruby_xml_xinclude.h", "ext/libxml/ruby_xml_xpath.c", "ext/libxml/ruby_xml_xpath.h", "ext/libxml/ruby_xml_xpath_context.c", "ext/libxml/ruby_xml_xpath_context.h", "ext/libxml/ruby_xml_xpath_expression.c", "ext/libxml/ruby_xml_xpath_expression.h", "ext/libxml/ruby_xml_xpath_object.c", "ext/libxml/ruby_xml_xpath_object.h", "ext/libxml/ruby_xml_xpointer.c", "ext/libxml/ruby_xml_xpointer.h", "ext/libxml/sax_parser_callbacks.inc", "ext/libxml/version.h", "ext/mingw/Rakefile", "ext/mingw/build.rake", "ext/vc/libxml_ruby.sln", "ext/vc/libxml_ruby.vcproj", "lib/libxml", "lib/libxml/attr.rb", "lib/libxml/attributes.rb", "lib/libxml/document.rb", "lib/libxml/error.rb", "lib/libxml/hpricot.rb", "lib/libxml/html_parser.rb", "lib/libxml/node.rb", "lib/libxml/parser.rb", "lib/libxml/parser_context.rb", "lib/libxml/parser_options.rb", "lib/libxml/properties.rb", "lib/libxml/reader.rb", "lib/libxml/sax_callbacks.rb", "lib/libxml/sax_parser.rb", "lib/libxml/tree.rb", "lib/libxml/xpath_object.rb", "lib/libxml.rb", "lib/xml", "lib/xml/libxml.rb", "lib/xml.rb", "test/etc_doc_to_s.rb", "test/ets_copy_bug.rb", "test/ets_copy_bug3.rb", "test/ets_doc_file.rb", "test/ets_doc_to_s.rb", "test/ets_gpx.rb", "test/ets_node_gc.rb", "test/ets_test.xml", "test/ets_tsr.rb", "test/model", "test/model/atom.xml", "test/model/books.xml", "test/model/default_validation_bug.rb", "test/model/merge_bug_data.xml", "test/model/ruby-lang.html", "test/model/rubynet.xml", "test/model/rubynet_project", "test/model/saxtest.xml", "test/model/shiporder.rnc", "test/model/shiporder.rng", "test/model/shiporder.xml", "test/model/shiporder.xsd", "test/model/simple.xml", "test/model/soap.xml", "test/model/xinclude.xml", "test/tc_attributes.rb", "test/tc_deprecated_require.rb", "test/tc_document.rb", "test/tc_document_write.rb", "test/tc_dtd.rb", "test/tc_error.rb", "test/tc_html_parser.rb", "test/tc_input.rb", "test/tc_node.rb", "test/tc_node_attr.rb", "test/tc_node_cdata.rb", "test/tc_node_comment.rb", "test/tc_node_copy.rb", "test/tc_node_edit.rb", "test/tc_node_text.rb", "test/tc_node_xlink.rb", "test/tc_ns.rb", "test/tc_parser.rb", "test/tc_parser_context.rb", "test/tc_properties.rb", "test/tc_reader.rb", "test/tc_relaxng.rb", "test/tc_sax_parser.rb", "test/tc_schema.rb", "test/tc_traversal.rb", "test/tc_well_formed.rb", "test/tc_xinclude.rb", "test/tc_xml.rb", "test/tc_xpath.rb", "test/tc_xpath_context.rb", "test/tc_xpath_expression.rb", "test/tc_xpointer.rb", "test/test_suite.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://libxml.rubyforge.org/}
  s.require_paths = ["lib", "ext/libxml"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.4")
  s.rubyforge_project = %q{libxml}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Ruby libxml bindings}
  s.test_files = ["test/tc_attributes.rb", "test/tc_deprecated_require.rb", "test/tc_document.rb", "test/tc_document_write.rb", "test/tc_dtd.rb", "test/tc_error.rb", "test/tc_html_parser.rb", "test/tc_input.rb", "test/tc_node.rb", "test/tc_node_attr.rb", "test/tc_node_cdata.rb", "test/tc_node_comment.rb", "test/tc_node_copy.rb", "test/tc_node_edit.rb", "test/tc_node_text.rb", "test/tc_node_xlink.rb", "test/tc_ns.rb", "test/tc_parser.rb", "test/tc_parser_context.rb", "test/tc_properties.rb", "test/tc_reader.rb", "test/tc_relaxng.rb", "test/tc_sax_parser.rb", "test/tc_schema.rb", "test/tc_traversal.rb", "test/tc_well_formed.rb", "test/tc_xinclude.rb", "test/tc_xml.rb", "test/tc_xpath.rb", "test/tc_xpath_context.rb", "test/tc_xpath_expression.rb", "test/tc_xpointer.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
