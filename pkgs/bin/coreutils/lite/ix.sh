{% extends '//bin/coreutils/9/1/ix.sh' %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block configure_flags %}
{{super()}}
--without-gmp
--with-openssl=no
{% endblock %}
