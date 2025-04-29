{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
xorg-util-macros
{% endblock %}

{% block version %}
1.20.2
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/xorg/util/macros/-/archive/util-macros-{{self.version().strip()}}/macros-util-macros-{{self.version().strip()}}.tar.bz2
sha:e817e356ae6a2b72978a7ffecf7c2ab47aef376827af0a0e1cf2c6fd2f542d62
{% endblock %}

{% block bld_tool %}
bld/auto
{% endblock %}

{% block strip_pc %}
: actually need it
{% endblock %}
