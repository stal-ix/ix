{% extends '//die/c/meson.sh' %}

{% block version %}
0.2.2
{% endblock %}

{% block fetch %}
https://git.sr.ht/~brocellous/wlrctl/archive/v{{self.version().strip()}}.tar.gz
sha:b5b3836091c41de09a832df1e5eb4747841d7ae670367e413487d5be7a5f2849
{% endblock %}

{% block bld_libs %}
lib/c
lib/wlroots/16
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
