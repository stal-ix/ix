{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
microsoft-edit
{% endblock %}

{% block version %}
1.2.1
{% endblock %}

{% block cargo_url %}
https://github.com/microsoft/edit/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
5fe665348c73eb7f840b707fb4589d70c5e7e6fac242edfc9e7aa1ce3365b79d
{% endblock %}

{% block cargo_bins %}
edit
{% endblock %}

{% block cargo_tool %}
bld/cargo/87
{% endblock %}

{% block bld_libs %}
lib/icu/dl
{% endblock %}
