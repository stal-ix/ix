{% extends '//die/c/meson.sh' %}

{#
#ping: Invalid flags, broken ai_flags
#lib/idn/2
#}

{% block fetch %}
https://github.com/iputils/iputils/archive/refs/tags/20240117.tar.gz
sha:a5d66e2997945b2541b8f780a7f5a5ec895d53a517ae1dc4f3ab762573edea9a
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/intl
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/fake/er(tool_name=xsltproc)
{% endblock %}

{% block meson_flags %}
USE_IDN=false
SKIP_TESTS=true
SETCAP_OR_SUID_PING=false
{% endblock %}
