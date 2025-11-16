{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
miniserve
{% endblock %}

{% block version %}
0.32.0
{% endblock %}

{% block cargo_url %}
https://github.com/svenstaro/miniserve/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
238e402413105d33426bd1c3bd1467d6229f0832b93950660c3edea1129a0c53
{% endblock %}

{% block cargo_tool %}
bld/cargo/91
{% endblock %}

{% block bld_libs %}
lib/zstd
{% endblock %}

{% block cargo_bins %}
miniserve
{% endblock %}
