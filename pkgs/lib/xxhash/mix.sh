{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/Cyan4973/xxHash/archive/refs/tags/v0.8.0.tar.gz
62310678857c30fcef4128f41f711f49
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
