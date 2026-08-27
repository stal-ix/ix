{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
icu
{% endblock %}

{% block version %}
78.3
{% endblock %}

{% block fetch %}
https://github.com/unicode-org/icu/archive/refs/tags/release-{{self.version().strip()}}.tar.gz
f06bcab72736ee9d55689033b8198a178562354128cf38edb2afc2e67e3fd931
{% endblock %}

{% block unpack %}
{{super()}}
cd icu4c/source
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block make_flags %}
GEN_DEPS.c=true
GEN_DEPS.cc=true
{% endblock %}

{% block install %}
{{super()}}
{% if lib %}
find ${out} -type f -name '*.pc' | while read l; do
    sed -e 's|^#.*||' -i ${l}
done
{% endif %}
{% endblock %}
