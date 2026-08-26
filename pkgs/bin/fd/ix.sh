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
81d4868cfef5068406c5dfc41c868b5c4a3984b64df3c53a44246e46df5694f7
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
