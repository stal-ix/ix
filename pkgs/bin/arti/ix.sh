{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
arti
{% endblock %}

{% block version %}
1.4.1
{% endblock %}

{% block cargo_url %}
https://gitlab.torproject.org/tpo/core/arti/-/archive/arti-v{{self.version().strip()}}/arti-arti-v{{self.version().strip()}}.tar.bz2
{% endblock %}

{% block cargo_fetch_sha %}
61a50b34bf9a9fc96b03a8652d8db4d2948fe63793f354a6a2f597245ca1f59d
{% endblock %}

{% block cargo_sha %}
74c0b9beec842360dccb0e2eb200ce3c13d033d37c6fdf0292478e55206c72c3
{% endblock %}

{% block bld_libs %}
lib/z
lib/xz
lib/zstd
lib/openssl
lib/sqlite/3
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/arti ${out}/bin/
{% endblock %}
