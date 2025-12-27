{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
jujutsu
{% endblock %}

{% block version %}
0.36.0
{% endblock %}

{% block cargo_url %}
https://github.com/martinvonz/jj/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
63e051ff0aa72f6db765fe18773e279264c1253b773a5c829fe00de2119ba7b2
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
