{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
xh
{% endblock %}

{% block version %}
0.26.2
{% endblock %}

{% block cargo_url %}
https://github.com/ducaale/xh/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
9cedba72c6341dc3056b266ae298aadab811361e701ecd7c39649fa44e8f783b
{% endblock %}

{% block bld_libs %}
lib/c
lib/oniguruma
{% endblock %}

{% block cargo_features %}
rustls
{% endblock %}

{% block cargo_bins %}
xh
{% endblock %}

{% block cargo_tool %}
bld/cargo/96
{% endblock %}
