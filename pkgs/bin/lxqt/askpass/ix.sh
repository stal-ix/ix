{% extends '//die/c/lxqt.sh' %}

{% block fetch %}
https://github.com/lxqt/lxqt-openssh-askpass/archive/refs/tags/2.0.0.tar.gz
sha:f027e58115226472f399d9a707b0ff334642bdd59e5741da89c7a3bb05de7790
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
