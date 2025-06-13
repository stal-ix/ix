{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
autoconf-archive
{% endblock %}

{% block version %}
2024.10.16
{% endblock %}

{% block fetch %}
https://mirror.tochlab.net/pub/gnu/autoconf-archive/autoconf-archive-{{self.version().strip()}}.tar.xz
7bcd5d001916f3a50ed7436f4f700e3d2b1bade3ed803219c592d62502a57363
{% endblock %}

{% block bld_tool %}
bld/fake(tool_name=texinfo)
bld/fake(tool_name=makeinfo)
{% endblock %}
