{% extends '//mix/c_std.sh' %}

{% block fetch %}
https://github.com/TartanLlama/expected/archive/refs/tags/v1.0.0.tar.gz
sha:8f5124085a124113e75e3890b4e923e3a4de5b26a973b891b3deb40e19c03cee
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block install %}
cp -R include ${out}/
{% endblock %}
