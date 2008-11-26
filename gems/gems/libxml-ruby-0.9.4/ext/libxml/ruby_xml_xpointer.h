/* $Id: ruby_xml_xpointer.h 630 2008-11-24 06:53:01Z cfis $ */

/* Please see the LICENSE file for copyright and distribution information */

#ifndef __rxml_XPOINTER__
#define __rxml_XPOINTER__

extern VALUE cXMLXPointer;

void ruby_init_xml_xpointer(void);
VALUE rxml_xpointer_point2(VALUE node, VALUE xptr_str);

#endif
