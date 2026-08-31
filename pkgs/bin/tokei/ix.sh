{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
tokei
{% endblock %}

{% block version %}
14.0.0
{% endblock %}

{% block cargo_url %}
https://github.com/XAMPPRocky/tokei/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
3165031b0295f8c6410f3c7b6e5e70b19abb90d49a3cea282202d262d6d45a7b
{% endblock %}

{% block cargo_bins %}
tokei
{% endblock %}

{% block cargo_tool %}
bld/cargo/96
{% endblock %}
