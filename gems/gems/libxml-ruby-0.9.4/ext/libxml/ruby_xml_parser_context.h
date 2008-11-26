/* $Id: ruby_xml_parser_context.h 612 2008-11-21 08:01:29Z cfis $ */

/* Please see the LICENSE file for copyright and distribution information */

#ifndef __rxml_PARSER_CONTEXT__
#define __rxml_PARSER_CONTEXT__

extern VALUE cXMLParserContext;

void ruby_init_xml_parser_context(void);
VALUE rxml_parser_context_wrap(xmlParserCtxtPtr ctxt);

#endif
