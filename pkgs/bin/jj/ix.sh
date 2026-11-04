{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
jujutsu
{% endblock %}

{% block version %}
0.47.0
{% endblock %}

{% block cargo_url %}
https://github.com/martinvonz/jj/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
e68d9c4c880f5d322adb22806cda7abe36066ba42cfac92968975e42f30a46db
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
