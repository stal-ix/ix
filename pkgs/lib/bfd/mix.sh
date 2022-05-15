{% extends '//mix/autohell.sh' %}

{% block fetch %}
{% include '//bin/binutils/t/ver.sh' %}
{% endblock %}

{% block unpack %}
{{super()}}
cd bfd
{% endblock %}

{% block bld_libs %}
lib/z
lib/c
{% endblock %}

{% block configure_flags %}
--enable-targets=all
{% endblock %}
