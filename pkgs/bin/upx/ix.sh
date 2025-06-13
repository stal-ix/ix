{% extends '//die/c/cmake.sh' %}

{% block version %}
5.0.1
{% endblock %}

{% block pkg_name %}
upx
{% endblock %}

{% block fetch %}
https://github.com/upx/upx/releases/download/v{{self.version().strip()}}/upx-{{self.version().strip()}}-src.tar.xz
2b11323a9f6c7f0247a4936deee35afb486a2fdf808a5bc4abf10a085ec884d9
{% endblock %}

{% block bld_libs  %}
lib/c
lib/c++
{% endblock %}
