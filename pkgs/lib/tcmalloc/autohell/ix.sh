{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/gperftools/gperftools/releases/download/gperftools-2.9.1/gperftools-2.9.1.tar.gz
sha:ea566e528605befb830671e359118c2da718f721c27225cbbc93858c7520fee3
{% endblock %}

{% block lib_deps %}
lib/reallocarray
lib/c++/dispatch
{% endblock %}

{% block bld_libs %}
lib/bumpalloc
# for LTO configure
lib/compiler_rt/builtins/hack/ish
{% endblock %}

{% block make_target %}
libtcmalloc_minimal.la
{% endblock %}

{% block make_install_target %}
install-libLTLIBRARIES
{% endblock %}

{% block configure_flags %}
--enable-minimal
--enable-sized-delete
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/lib/libtcmalloc_minimal_debug.a
{% endblock %}

{% block env %}
export ac_cv_func_malloc_0_nonnull=yes
{% endblock %}
