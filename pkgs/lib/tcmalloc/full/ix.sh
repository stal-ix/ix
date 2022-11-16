{% extends '//lib/tcmalloc/cmake/ix.sh' %}

{% block bld_libs %}
lib/kernel
{{super()}}
{% endblock %}

{% block patch %}
sed -e 's|static_cast<uintptr_t>|(uintptr_t)|' -i src/heap-checker.cc
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
gperftools_enable_frame_pointers=ON
{% endblock %}

{% block configure %}
{{super()}}
sed -e 's|.*HAVE_LIBUN.*||' -i ${tmp}/obj/config.h
{% endblock %}
