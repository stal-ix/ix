{% extends '//die/c/cmake.sh' %}

{% block version %}
5.0.0
{% endblock %}

{% block pkg_name %}
upx
{% endblock %}

{% block fetch %}
https://github.com/upx/upx/releases/download/v{{self.version().strip()}}/upx-{{self.version().strip()}}-src.tar.xz
sha:e0eb96f9c50aefdb02eca445f8ed76aca5cd70b6b132bf61bea3ba4b8ebb64cc
{% endblock %}

{% block bld_libs  %}
lib/c
lib/c++
{% endblock %}
