{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/7mind/jopa
{% endblock %}

{% block git_commit %}
9ba3c83a90660ec34b72ebf0475752233b876833
{% endblock %}

{% block git_sha %}
f84e891b7d77afa85d2a3a13d9a7b737d6d584d1d03d54512efa1ac01028493e
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/icu
lib/zip
{% endblock %}

{% block bld_tool %}
bin/zip
bld/make
bld/python
bld/fake(tool_name=jar)
{% endblock %}

{% block cmake_flags %}
JOPA_BUILD_JAMVM=OFF
{% endblock %}

{% block build_flags %}
no_werror
{% endblock %}

{% block ninja_targets %}
src/jopa
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/src/jopa ${out}/bin/
{% endblock %}
