{% extends '//bin/coreutils/9/0/mix.sh' %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block configure_flags %}
{{super()}}
--without-gmp
--with-openssl=no
{% endblock %}
