{% extends '//lib/pcre/2/mix.sh' %}

{% block bld_libs %}
lib/z
lib/bzip2
lib/readline
{{super()}}
{% endblock %}

{% block configure_flags %}
--enable-pcre2grep-libz
--enable-pcre2grep-libbz2
{{super()}}
{% endblock %}
