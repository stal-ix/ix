{% extends '//die/c/lxqt.sh' %}

{% block pkg_name %}
lxqt-openssh-askpass
{% endblock %}

{% block version %}
2.4.0
{% endblock %}

{% block fetch %}
https://github.com/lxqt/lxqt-openssh-askpass/archive/refs/tags/{{self.version().strip()}}.tar.gz
a5a03c3155ac3803e48f3d7966cf1db710ef90a7cabd4d66854db941565e4d49
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/lx/qt
lib/qt/6/base
lib/qt/6/deps
{% endblock %}

{% block bld_tool %}
bld/perl
{{super()}}
{% endblock %}
