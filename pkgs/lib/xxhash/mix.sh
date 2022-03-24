{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/Cyan4973/xxHash/archive/refs/tags/v0.8.1.tar.gz
sha:3bb6b7d6f30c591dd65aaaff1c8b7a5b94d81687998ca9400082c739a690436c
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/c++
{% endblock %}

{% block std_box %}
bld/python
{{super()}}
{% endblock %}

{% import '//mix/hooks.sh' as hooks %}

{% block setup_tools %}
{{hooks.wrap_c_compilers()}}
{% endblock %}

{% block test_execute %}
make NO_C90_TEST=true test
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-xxhash=${out} --with-libxxhash-prefix=${out} \${COFLAGS}"
{% endblock %}
