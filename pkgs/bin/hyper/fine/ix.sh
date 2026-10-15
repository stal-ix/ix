{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
hyperfine
{% endblock %}

{% block version %}
1.21.0
{% endblock %}

{% block cargo_url %}
https://github.com/sharkdp/hyperfine/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
2e28f1e0437c90639e7fa27e29a22b9841e77218d4cf2ecaa256afb47e328136
{% endblock %}

{% block cargo_bins %}
hyperfine
{% endblock %}

{% block cargo_tool %}
bld/cargo/96
{% endblock %}
