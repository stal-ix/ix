{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
icu
{% endblock %}

{% block version %}
79.1
{% endblock %}

{% block fetch %}
https://github.com/unicode-org/icu/archive/refs/tags/release-{{self.version().strip()}}.tar.gz
195b1dbb083321cc097e8cf88eca73de34fb41418f091748f7b6a829a4d40f1d
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
