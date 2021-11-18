{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
lib/dlfcn/mix.sh
lib/z/mix.sh
lib/xz/mix.sh
lib/ffi/mix.sh
lib/intl/mix.sh
lib/gdbm/mix.sh
lib/bzip2/mix.sh
lib/iconv/mix.sh
lib/expat/mix.sh
lib/sqlite3/mix.sh
lib/curses/mix.sh
lib/openssl/mix.sh
lib/mpdecimal/mix.sh
lib/{{edit or 'edit'}}/mix.sh
{{'lib/darwin/framework/SystemConfiguration/mix.sh' | darwin}}
{% endblock %}
