{% extends '//lib/z/ng/t/ix.sh' %}

{% block cmake_flags %}
{{super()}}
ZLIB_COMPAT=OFF
ZLIB_SYMBOL_PREFIX=
{% endblock %}

{% block c_rename_symbol %}
{{super()}}
alloc_deflate
alloc_inflate
free_inflate
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/lib/libz-ng.a ${out}/lib/libz-ng-ex.a
{% endblock %}
