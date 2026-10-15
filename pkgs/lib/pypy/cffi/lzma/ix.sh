{% extends '//lib/pypy/cffi/t/ix.sh' %}

{% include '//lib/pypy/cffi/lzma/mod.sh' %}

{# lib_deps, not bld_libs: whoever links this archive needs liblzma on
   the same line, and bld_libs stop here #}
{% block lib_deps %}
lib/xz
{% endblock %}
