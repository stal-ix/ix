{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
# url https://github.com/jtanx/libclipboard/archive/refs/tags/v1.1.tar.gz
# md5 bddc22070b6804ed63994af49b778b70
{% endblock %}

{% block deps %}
# {{'lib sys/framework/AppKit' | darwin}}
# bld dev/build/cmake dev/build/pkg-config env/std
{% endblock %}
