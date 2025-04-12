{% extends '//die/c/meson.sh' %}

{% block version %}
20240905
{% endblock %}

{#
#ping: Invalid flags, broken ai_flags
#lib/idn/2
#}

{% block fetch %}
https://github.com/iputils/iputils/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:055b4e6e4f298c97fd5848898099e59b4590db63fac3f7ad4fa796354ad44403
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
