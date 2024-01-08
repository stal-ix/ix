{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/upx/upx/releases/download/v4.2.2/upx-4.2.2-src.tar.xz
sha:42ee0455eea610ef7ee732aa1f657b34a351ebcfa64a24c1e2a7aaec74c1e038
{% endblock %}

{% block bld_libs  %}
lib/c
lib/c++
{% endblock %}
