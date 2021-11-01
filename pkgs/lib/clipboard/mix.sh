{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
# url https://github.com/jtanx/libclipboard/archive/refs/tags/v1.1.tar.gz
# md5 bddc22070b6804ed63994af49b778b70
{% endblock %}

{% block lib_deps %}
{{'sys/framework/AppKit/mix.sh' | darwin}}
{% endblock %}

{% block bld_deps %}
dev/build/cmake/mix.sh
dev/build/pkg-config/mix.sh
env/std/mix.sh
{% endblock %}
