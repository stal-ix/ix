{% extends '//die/c/cmake.sh' %}

{% block version %}
5.3.0
{% endblock %}

{% block pkg_name %}
upx
{% endblock %}

{% block fetch %}
https://github.com/upx/upx/releases/download/v{{self.version().strip()}}/upx-{{self.version().strip()}}-src.tar.xz
6229b5564dd91dd423a5280a7c15b70fc05449d2605bb853ce076743057fcf55
{% endblock %}

{% block bld_libs  %}
lib/c
lib/c++
{% endblock %}
