{% extends '//die/rust/cargo.sh' %}

{# hard luajit vendor #}

{% block cargo_url %}
https://github.com/sayanarijit/xplr/archive/refs/tags/v0.21.5.tar.gz
{% endblock %}

{% block cargo_sha %}
60398192f13dcdc5de328bb7ea740ae274617e6688bcd2a6ba812f4c99fe285e
{% endblock %}

{% block bld_tool %}
bld/make
{% endblock %}

{% block patch %}
{{super()}}
cat .cargo/config
rm .cargo/config
{% endblock %}
