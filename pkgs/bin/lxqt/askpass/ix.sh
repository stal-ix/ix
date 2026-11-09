{% extends '//die/c/lxqt.sh' %}

{% block pkg_name %}
lxqt-openssh-askpass
{% endblock %}

{% block version %}
2.5.0
{% endblock %}

{% block fetch %}
https://github.com/lxqt/lxqt-openssh-askpass/archive/refs/tags/{{self.version().strip()}}.tar.gz
e35b49dc09d0cc794cfa95caabe370db31546830071c427c0c297130ab4027a2
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
