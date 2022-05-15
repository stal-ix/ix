{% extends '//mix/autohell.sh' %}

{% block fetch %}
{% include '//bin/binutils/ver.sh' %}
{% endblock %}

{% block unpack %}
{{super()}}
cd opcodes
{% endblock %}

{% block lib_deps %}
lib/c
lib/bfd
{% endblock %}

{% block configure_flags %}
--enable-targets=all
{% endblock %}

{% block patch %}
echo 0 > ../bfd/libtool-soversion
{% endblock %}
