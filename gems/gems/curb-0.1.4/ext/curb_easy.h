/* curb_easy.h - Curl easy mode
 * Copyright (c)2006 Ross Bamford. 
 * Licensed under the Ruby License. See LICENSE for details.
 * 
 * $Id: curb_easy.h 25 2006-12-07 23:38:25Z roscopeco $
 */
#ifndef __CURB_EASY_H
#define __CURB_EASY_H

#include "curb.h"

#include <curl/easy.h>

/* a lot of this *could* be kept in the handler itself,
 * but then we lose the ability to query it's status.
 */
typedef struct {
  /* The handler */
  CURL *curl;
  
  /* Objects we associate */
  VALUE url;  
  VALUE proxy_url;
  
  VALUE body_proc;
  VALUE header_proc;  
  VALUE body_data;      /* These have the result from the last curl_easy_perform */
  VALUE header_data;    /* unless a block is supplied (when they'll be nil)      */
  VALUE progress_proc;
  VALUE debug_proc;
  VALUE interface;
  VALUE userpwd;
  VALUE proxypwd;
  VALUE headers;        /* ruby array of strings with headers to set */
  VALUE cookiejar;      /* filename */
  
  /* Other opts */
  unsigned short local_port;       // 0 is no port
  unsigned short local_port_range; // "  "  " "
  unsigned short proxy_port;       // "  "  " " 
  int proxy_type;
  long http_auth_types;
  long proxy_auth_types;
  long max_redirs;
  unsigned long timeout;
  unsigned long connect_timeout;
  long dns_cache_timeout;
  unsigned long ftp_response_timeout;

  /* bool flags */  
  char proxy_tunnel;
  char fetch_file_time;
  char ssl_verify_peer;
  char ssl_verify_host;
  char header_in_body;
  char use_netrc;
  char follow_location;
  char unrestricted_auth;
  char verbose;  
  char multipart_form_post;
  char enable_cookies;
  
  /* this is sometimes used as a buffer for a form data string,
   * which we alloc in C and need to hang around for the call,
   * and in case it's asked for before the next call.
   */
  VALUE postdata_buffer;  
} ruby_curl_easy;

extern VALUE cCurlEasy;

void init_curb_easy();

#endif
