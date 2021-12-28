{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/ffi
lib/intl
lib/gdbm
lib/bzip2
lib/iconv
lib/expat
lib/sqlite3
lib/curses
lib/openssl
lib/mpdecimal
lib/{{edit or 'edit'}}
{% if target.os == 'darwin' %}
lib/darwin/framework/SystemConfiguration
{% endif %}
{% endblock %}
