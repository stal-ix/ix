{% extends '//bin/coreutils/9/1/ix.sh' %}

{% block bld_libs %}
lib/c
lib/shim/extra
{% endblock %}

{% block configure_flags %}
{{super()}}
--without-gmp
--with-openssl=no
{% endblock %}
