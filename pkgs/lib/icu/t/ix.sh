{% extends '//die/c/autohell.sh' %}

{#
broken webkit build
https://github.com/unicode-org/icu/archive/refs/tags/release-76-1.tar.gz
sha:a2c443404f00098e9e90acf29dc318e049d2dc78d9ae5f46efb261934a730ce2
#}

{% block fetch %}
https://github.com/unicode-org/icu/archive/refs/tags/release-75-1.tar.gz
sha:925e6b4b8cf8856e0ac214f6f34e30dee63b7bb7a50460ab4603950eff48f89e
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
