{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
du-dust
{% endblock %}

{% block version %}
1.2.5
{% endblock %}

{% block cargo_url %}
https://github.com/bootandy/dust/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
81d4868cfef5068406c5dfc41c868b5c4a3984b64df3c53a44246e46df5694f7
{% endblock %}

{% block cargo_bins %}
dust
{% endblock %}

{% block cargo_tool %}
bld/cargo/91
{% endblock %}
