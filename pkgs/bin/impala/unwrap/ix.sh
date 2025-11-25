{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
impala
{% endblock %}

{% block version %}
0.5.0
{% endblock %}

{% block cargo_url %}
https://github.com/pythops/impala/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
b0db2276b8d5f67c431d140389389c4bc9b10a1e54354c8012aa7d13073e3171
{% endblock %}

{% block cargo_bins %}
impala
{% endblock %}

{% block cargo_tool %}
bld/cargo/91
{% endblock %}
