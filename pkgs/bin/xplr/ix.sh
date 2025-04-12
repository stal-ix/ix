{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
xplr
{% endblock %}

{% block version %}
0.21.5
{% endblock %}

{# hard luajit vendor #}

{% block cargo_url %}
https://github.com/sayanarijit/xplr/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
aaef65b91d0fdd616fd373d370164fac68a17f259b5489958586e1e72756b888
{% endblock %}

{% block bld_tool %}
bld/make
{% endblock %}

{% block patch %}
{{super()}}
cat .cargo/config
rm .cargo/config
{% endblock %}
