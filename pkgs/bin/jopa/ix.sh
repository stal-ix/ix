{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/7mind/jopa
{% endblock %}

{% block git_commit %}
1609fe6e2bad76eb350b844b5ee576a391434757
{% endblock %}

{% block git_sha %}
64b37bedcade355c9838732ce6442143ef7018ff68729e8b5345841916b68038
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
