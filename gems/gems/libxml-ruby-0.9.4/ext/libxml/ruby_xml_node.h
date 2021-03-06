/* $Id: ruby_xml_node.h 612 2008-11-21 08:01:29Z cfis $ */

/* Please see the LICENSE file for copyright and distribution information */

#ifndef __rxml_NODE__
#define __rxml_NODE__

extern VALUE cXMLNode;

void ruby_init_xml_node(void);
void rxml_node_mark_common(xmlNodePtr xnode);
VALUE rxml_node2_wrap(VALUE class, xmlNodePtr xnode);
VALUE check_string_or_symbol(VALUE val);
#endif
