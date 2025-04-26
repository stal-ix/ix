{% extends '//die/c/lxqt.sh' %}

{% block pkg_name %}
lxqt-openssh-askpass
{% endblock %}

{% block version %}
2.2.0
{% endblock %}

{% block fetch %}
https://github.com/lxqt/lxqt-openssh-askpass/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:75ad29ebca4253aa8b0fe640fc4922fa859dfdfc40a6a51358f5ffc603009fda
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
