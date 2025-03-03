{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/jedisct1/libsodium/archive/refs/tags/1.0.20-RELEASE.tar.gz
sha:8e5aeca07a723a27bbecc3beef14b0068d37e7fc0e97f51b3f1c82d2a58005c1
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bin/getopt
{% endblock %}

{% block patch %}
rm autogen.sh
{% endblock %}

{% block c_rename_symbol %}
blake2b
blake2b_compress_avx2
blake2b_compress_ref
blake2b_compress_sse41
blake2b_compress_ssse3
blake2b_final
blake2b_init
blake2b_init_key
blake2b_init_key_salt_personal
blake2b_init_param
blake2b_init_salt_personal
blake2b_long
blake2b_pick_best_implementation
blake2b_salt_personal
blake2b_update
{% endblock %}
