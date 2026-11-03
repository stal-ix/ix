{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
jujutsu
{% endblock %}

{% block version %}
0.46.0
{% endblock %}

{% block cargo_url %}
https://github.com/martinvonz/jj/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
268d843a5e153a43cc8fe217bc6a84bf671ccab3d4b2dd6bba06cd6a120ba09f
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
bld/cargo/97
{% endblock %}
