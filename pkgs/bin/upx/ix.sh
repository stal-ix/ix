{% extends '//die/c/cmake.sh' %}

{% block version %}
5.2.1
{% endblock %}

{% block pkg_name %}
upx
{% endblock %}

{% block fetch %}
https://github.com/upx/upx/releases/download/v{{self.version().strip()}}/upx-{{self.version().strip()}}-src.tar.xz
a7d457be4ef942e46844ee8f301206b111394cbcbde3599747a6904c54ff116b
{% endblock %}

{% block bld_libs  %}
lib/c
lib/c++
{% endblock %}
