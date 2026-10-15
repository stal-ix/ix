{% extends '//lib/xxhash/t/ix.sh' %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/shim/alloc
lib/compiler_rt/builtins
{% endblock %}

{% block make_target %}
libxxhash.a
{% endblock %}

{% block make_install_target %}
install_libxxhash.a
install_libxxhash.includes
install_libxxhash.pc
{% endblock %}

{% block env %}
{{super()}}
export COFLAGS="--with-xxhash=${out} --with-libxxhash-prefix=${out} \${COFLAGS}"
{% endblock %}
