{% extends '//die/c/autorehell.sh' %}

{#
../src/libsoup/soup-xmlrpc.c:1206:8: error: call to undeclared function 'xmlParseMemory'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
 1206 |         doc = xmlParseMemory (method_call, length == -1 ? strlen (method_call) : length);
../src/libsoup/soup-xmlrpc.c:1286:8: error: call to undeclared function 'xmlParseMemory'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
1286 |         doc = xmlParseMemory (method_response,
#}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libxml2/-/archive/v2.11.4/libxml2-v2.11.4.tar.bz2
sha:a9493ae091f58037dd5e73fc6035a4907eae58e2cc4756abc4e6253ee6036166
{% endblock %}

{% block lib_deps %}
lib/c
lib/iconv
{% endblock %}

{% block configure_flags %}
--with-ftp=off
--with-http=off
--with-modules=off
--disable-python
--without-python
{% endblock %}
