{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/upx/upx/releases/download/v4.2.0/upx-4.2.0-src.tar.xz
sha:09b89fe127fbcb8222dc519badc8cc4da0b2f9f661f2d699d0b2a79e167161fa
{% endblock %}

{% block bld_libs  %}
lib/c
lib/c++
{% endblock %}
