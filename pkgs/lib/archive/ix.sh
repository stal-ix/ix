{% extends '//lib/archive/t/ix.sh' %}

{% block lib_deps %}
lib/c
lib/z
lib/xz
lib/lz4
lib/lzo
lib/zstd
lib/iconv
lib/expat
lib/bzip/2
{% endblock %}

{% block c_rename_symbol %}
blake2s_init_param
blake2s_init
blake2s_init_key
blake2s_update
blake2s_final
blake2s
{{super()}}
{% endblock %}
