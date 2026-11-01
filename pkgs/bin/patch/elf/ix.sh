{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
patchelf
{% endblock %}

{% block version %}
0.19.3
{% endblock %}

{% block fetch %}
https://github.com/NixOS/patchelf/archive/refs/tags/{{self.version().strip()}}.tar.gz
c424c782c525ee0961006bec370cbdb19714fd4690c6552cc48ca21860ce4df3
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block autoreconf %}
sh bootstrap.sh
{% endblock %}
