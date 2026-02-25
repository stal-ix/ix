{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
jujutsu
{% endblock %}

{% block version %}
0.38.0
{% endblock %}

{% block cargo_url %}
https://github.com/martinvonz/jj/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
d95105c65f0bee57073c2b6642371273d6aabdc9a02a1d820dddaf8012bd0ed7
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
bld/cargo/91
{% endblock %}
