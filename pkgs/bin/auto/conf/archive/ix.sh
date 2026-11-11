{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
autoconf-archive
{% endblock %}

{% block version %}
2026.11.11
{% endblock %}

{% block fetch %}
https://mirror.tochlab.net/pub/gnu/autoconf-archive/autoconf-archive-{{self.version().strip()}}.tar.xz
2c18f15e2b3bb79e09622b27391df07d8608ce9f07fbfc7c1143fa683891ab26
{% endblock %}

{% block bld_tool %}
bld/fake(tool_name=texinfo)
bld/fake(tool_name=makeinfo)
{% endblock %}
