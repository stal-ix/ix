{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
jujutsu
{% endblock %}

{% block version %}
0.32.0
{% endblock %}

{% block cargo_url %}
https://github.com/martinvonz/jj/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
bb480d68e6ea8dcb0e7ce201008a4453a4d59f5a7fea853ee1e2c76127c1c6a3
{% endblock %}

{% block unpack %}
{{super()}}
cd cli
{% endblock %}

{% block bld_libs %}
lib/zstd
lib/git/2
lib/openssl
{% endblock %}

{% block cargo_bins %}
jj
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
