{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
miniserve
{% endblock %}

{% block version %}
0.35.0
{% endblock %}

{% block cargo_url %}
https://github.com/svenstaro/miniserve/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
46ecac1a89469e6f1fd4b2a67c575682f1c353460e17c7a72d76262a429dab1d
{% endblock %}

{% block cargo_tool %}
bld/cargo/96
{% endblock %}

{% block bld_libs %}
lib/zstd
{% endblock %}

{% block cargo_bins %}
miniserve
{% endblock %}
