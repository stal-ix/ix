{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/upx/upx/releases/download/v4.0.0/upx-4.0.0-src.tar.xz
sha:eaf938f8824e65f06852142fda97f8349ad660612979fa311618109c819f36ea
{% endblock %}

{% block bld_libs  %}
lib/c
lib/c++
{% endblock %}
