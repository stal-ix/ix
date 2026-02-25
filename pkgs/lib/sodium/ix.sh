{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libsodium
{% endblock %}

{% block version %}
1.0.21
{% endblock %}

{% block fetch %}
https://github.com/jedisct1/libsodium/archive/refs/tags/{{self.version().strip()}}-RELEASE.tar.gz
42e0ca94faaec901f4fbeda84b1b94b18f5309c360c66345cf52a7ab515b245b
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
