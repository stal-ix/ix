{% extends '//die/ninja.sh' %}

{% block fetch %}
https://github.com/mjansson/rpmalloc/archive/refs/tags/1.4.4.tar.gz
sha:3859620c03e6473f0b3f16a4e965e7c049594253f70e8370fb9caa0e4118accb
{% endblock %}

{% block lib_deps %}
lib/c/naked
{% endblock %}

{% block std_box %}
{{super()}}
bld/python
{% endblock %}

{% block ninja_build_dir %}${PWD}{% endblock %}

{% block configure %}
python3 ./configure.py --host {{host.os}} --target {{target.os}} --toolchain clang
{% endblock %}

{% block cpp_defines %}
ENABLE_PRELOAD=1
ENABLE_OVERRIDE=1
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp $(find lib/ -type f -name librpmalloc.a | grep release) ${out}/lib/
{% endblock %}

{% block patch %}
sed -e 's|if not .*|if 0:|' -i configure.py
{% endblock %}
