{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
b2
{% endblock %}

{% block version %}
5.5.3
{% endblock %}

{% block fetch %}
https://github.com/bfgroup/b2/archive/refs/tags/{{self.version().strip()}}.tar.gz
1a847a77466ff00961ffdecfb62e0b00738724970dec7f5bfc6f7e9d351dfb2a
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/bison
{% endblock %}
