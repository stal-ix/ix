{% extends '//lib/elfutils/t/mix.sh' %}

{% block bld_libs %}
lib/intl
lib/curl
lib/linux
lib/sqlite3
lib/archive
lib/microhttpd
{{super()}}
{% endblock %}

{% block configure_flags %}
{{super()}}
--enable-deterministic-archives
{% endblock %}
