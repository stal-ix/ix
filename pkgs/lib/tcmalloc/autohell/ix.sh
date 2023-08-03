{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/gperftools/gperftools/releases/download/gperftools-2.10/gperftools-2.10.tar.gz
sha:83e3bfdd28b8bcf53222c3798d4d395d52dadbbae59e8730c4a6d31a9c3732d8
{% endblock %}

{% block lib_deps %}
lib/reallocarray
lib/c++/dispatch
{% endblock %}

{% block bld_libs %}
lib/bumpalloc/small
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
