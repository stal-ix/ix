{% extends '//die/c/autohell.sh' %}

{% block version %}
2023.02.20
{% endblock %}

{% block fetch %}
https://mirror.tochlab.net/pub/gnu/autoconf-archive/autoconf-archive-{{self.version().strip()}}.tar.xz
sha:71d4048479ae28f1f5794619c3d72df9c01df49b1c628ef85fde37596dc31a33
{% endblock %}

{% block bld_tool %}
bld/fake(tool_name=texinfo)
bld/fake(tool_name=makeinfo)
{% endblock %}
