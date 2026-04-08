{% extends '//die/c/make.sh' %}

{% block pkg_name %}
cbonsai
{% endblock %}

{% block version %}
1.4.2
{% endblock %}

{% block fetch %}
https://gitlab.com/jallbrit/cbonsai/-/archive/v{{self.version().strip()}}/cbonsai-v{{self.version().strip()}}.tar.gz
75cf844940e5ef825a74f2d5b1551fe81883551b600fecd00748c6aa325f5ab0
{% endblock %}

{% block bld_libs %}
lib/c
lib/ncurses
{% endblock %}

{% block bld_tool %}
bld/pkg/config
bin/scdoc
{% endblock %}
