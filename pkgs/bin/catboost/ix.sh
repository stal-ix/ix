{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/catboost/catboost/archive/refs/tags/v1.0.6.tar.gz
sha:867c0beb9944a382a5680342c77e7718d0b43d862d9f4fd58b18a2a76f2af92c
{% endblock %}

{% block bld_tool %}
bld/make
bin/protoc
bld/python/2
{% endblock %}

{% block bld_libs %}
lib/c/naked
{% endblock %}

{% block build %}
make PYTHON=$(which python2) BUILD_ROOT=${tmp}/obj -f make/app.CLANG*
{% endblock %}

{% block patch %}
sed -e 's|.*error clang.*||' \
    -e 's|$(BUILD_ROOT)/contrib/tools/protoc/protoc|protoc|' \
    -i make/app.CLANG*
{% endblock %}

{% block cpp_defines %}
_musl_=1
{% endblock %}
