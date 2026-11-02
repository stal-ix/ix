{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
fd-find
{% endblock %}

{% block version %}
10.4.2
{% endblock %}

{% block cargo_url %}
https://github.com/sharkdp/fd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
9afd19c65bd942e847788005e6201d2046162b4997ccc129b685db01a893c2da
{% endblock %}

{% block cargo_ver %}
v4
{% endblock %}

{% block cargo_features %}
completions
{% endblock %}

{% block cargo_bins %}
fd
{% endblock %}

{% block cargo_tool %}
bld/cargo/91
{% endblock %}
