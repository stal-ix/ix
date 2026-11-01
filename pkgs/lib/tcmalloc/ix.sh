{% extends '//die/c/bazel.sh' %}

{# The targets come from tcmalloc's own BUILD files (see die/c/bazel.sh), so
   only what //tcmalloc:tcmalloc needs is compiled, each source with its
   target's flags. tcmalloc_variant picks another build of it, e.g.
   large_pages, 256k_pages, small_but_slow, numa_aware. #}

{% block fetch %}
https://github.com/google/tcmalloc/archive/876c092e7982a5585bb8bb01196d5c9ed99a4a6a.tar.gz
d4259e9f2172f0f8b4091d80afe6bbd5449c836aa03c46af3347cd7ba6ec467c
{% endblock %}

{% block lib_deps %}
lib/abseil/cpp
lib/tcmalloc/headers
lib/build/w/include/next
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block bazel_targets %}
{% if tcmalloc_variant %}
//tcmalloc:tcmalloc_{{tcmalloc_variant}}
{% else %}
//tcmalloc:tcmalloc
{% endif %}
{% endblock %}

{% block bazel_repos %}
com_google_absl
{% endblock %}

{# from tcmalloc's .bazelrc #}
{% block bazel_flags %}
--cxxopt=-std=c++17
--define=absl=1
{% endblock %}

{% block env %}
{{super()}}
export ac_cv_func_reallocarray=yes
export ac_cv_func_malloc_0_nonnull=yes
export ac_cv_func_realloc_0_nonnull=yes
{% endblock %}
