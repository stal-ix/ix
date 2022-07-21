{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/lz4/lz4/archive/refs/tags/v1.9.3.tar.gz
sha:030644df4611007ff7dc962d981f390361e6c97a34e5cbc393ddfbe019ffe2c1
{% endblock %}

{% block make_flags %}
BUILD_SHARED=no
{% endblock %}

{% block make_target %}
allmost
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
