{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libmicrodns
{% endblock %}

{% block version %}
0.2.0
{% endblock %}

{% block fetch %}
https://github.com/videolabs/libmicrodns/archive/refs/tags/{{self.version().strip()}}.tar.gz
9864a088ffef4d4255d5abf63c6f603d1dc343dfec2809ff0c3f1624045b80fa
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
