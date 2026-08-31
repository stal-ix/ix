{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
yazi
{% endblock %}

{% block version %}
26.8.15
{% endblock %}

{% block cargo_url %}
https://github.com/sxyazi/yazi/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
31dd732d27eb7ccb2d11ad8fcbd3fcf898561ef089f266f00094e59aa48dafb4
{% endblock %}

{% block bld_libs %}
lib/oniguruma
{% endblock %}

{% block unpack %}
{{super()}}
cd yazi-fm
{% endblock %}

{% block cargo_bins %}
yazi
{% endblock %}

{% block cargo_tool %}
bld/cargo/96
{% endblock %}
