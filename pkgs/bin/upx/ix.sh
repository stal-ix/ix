{% extends '//die/c/cmake.sh' %}

{% block version %}
5.0.2
{% endblock %}

{% block pkg_name %}
upx
{% endblock %}

{% block fetch %}
https://github.com/upx/upx/releases/download/v{{self.version().strip()}}/upx-{{self.version().strip()}}-src.tar.xz
209b219bbcfa58c249ffe6eba3c244e0910fa8be792b5521e4daf938167f05cc
{% endblock %}

{% block bld_libs  %}
lib/c
lib/c++
{% endblock %}
