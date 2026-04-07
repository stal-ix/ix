{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
terminal-use
{% endblock %}

{% block version %}
0.6.0
{% endblock %}

{% block cargo_url %}
https://github.com/flipbit03/terminal-use/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
17da0c5cb9d1823f0067213b82e27be87b62d22af2bc7a006fd5a92622d5911c
{% endblock %}

{% block cargo_bins %}
tu
{% endblock %}

{% block cargo_tool %}
bld/cargo/91
{% endblock %}
