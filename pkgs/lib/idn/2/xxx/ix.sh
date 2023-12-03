{% extends '//lib/idn/2/t/ix.sh' %}

{% block env %}
export COFLAGS="--with-libidn2=${out} \${COFLAGS}"
{% endblock %}

{% block make_flags %}
{{super()}}
LIBTOOL="slibtool-static -disable-shared -avoid-version -static"
{% endblock %}
