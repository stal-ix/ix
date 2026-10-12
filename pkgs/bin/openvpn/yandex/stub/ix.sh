{% extends '//die/inline/program.sh' %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block sources %}
stub.c
{% endblock %}

{% block cpp_defines %}
_GNU_SOURCE
{% endblock %}

{% block ld_flags %}
-Wl,--image-base=0x40000000
{% endblock %}

{% block setup_target %}
{{super()}}
export LDFLAGS="${LDFLAGS} ${SOLO_MUSL_TLS_OBJECT}"
{% endblock %}

{% block name %}
openvpn-yandex-solo-stub
{% endblock %}

{% block env %}
export OPENVPN_YANDEX_SOLO_STUB="${out}/bin/{{self.name().strip()}}"
{% endblock %}
