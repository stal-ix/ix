{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
iputils
{% endblock %}

{% block version %}
20250605
{% endblock %}

{#
#ping: Invalid flags, broken ai_flags
#lib/idn/2
#}

{% block fetch %}
https://github.com/iputils/iputils/archive/refs/tags/{{self.version().strip()}}.tar.gz
19e680c9eef8c079da4da37040b5f5453763205b4edfb1e2c114de77908927e4
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
