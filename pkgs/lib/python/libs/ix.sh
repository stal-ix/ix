{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/ffi
lib/intl
lib/gdbm
lib/iconv
lib/expat
lib/curses
lib/bzip/2
lib/openssl
lib/sqlite/3
lib/mpdecimal
lib/{{edit or 'edit'}}
{% if darwin %}
lib/darwin/framework/SystemConfiguration
{% endif %}
{% endblock %}
