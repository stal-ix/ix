{% extends '//lib/gnutls/t/ix.sh' %}

{% block configure_flags %}
{{super()}}
--disable-doc
--disable-tests
--disable-tools
{% endblock %}

{% block env %}
export COFLAGS="--with-gnutls=${out} \${COFLAGS}"
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|+= src/gl|+= |' -i Makefile.am
{% endblock %}
