{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
icu
{% endblock %}

{% block version %}
78.2
{% endblock %}

{% block fetch %}
https://github.com/unicode-org/icu/archive/refs/tags/release-{{self.version().strip()}}.tar.gz
45cfa1a4abe98db9732d19fa3cdb87f4f0ffb17012fab6afbb38b5de3b8771f7
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
