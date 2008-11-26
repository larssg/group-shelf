/* $Id: ruby_xml_document.h 614 2008-11-22 08:04:39Z cfis $ */

/* Please see the LICENSE file for copyright and distribution information */

#ifndef __rxml_DOCUMENT__
#define __rxml_DOCUMENT__

extern VALUE cXMLDocument;

void ruby_init_xml_document();


#if defined(_WIN32)
__declspec(dllexport) 
#endif
VALUE rxml_document_wrap(xmlDocPtr xnode);
#endif
