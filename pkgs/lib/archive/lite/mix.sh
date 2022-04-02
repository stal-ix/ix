{% extends '//lib/archive/mix.sh' %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/bzip2
{% endblock %}

{% block configure_flags %}
--without-xml2
--without-expat
{% endblock %}
