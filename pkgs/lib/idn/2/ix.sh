{% extends 't/ix.sh' %}

{% block configure_flags %}
{{super()}}
--enable-ld-version-script=no
--disable-ld-version-script
--without-ld-version-script
{% endblock %}

{% block env %}
export COFLAGS="--with-libidn2=${out} \${COFLAGS}"
{% endblock %}
