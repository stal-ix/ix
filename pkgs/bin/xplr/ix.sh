{% extends '//die/rust/cargo_v2.sh' %}

{# hard luajit vendor #}

{% block cargo_url %}
https://github.com/sayanarijit/xplr/archive/refs/tags/v0.21.5.tar.gz
{% endblock %}

{% block cargo_sha %}
ffae36ded8b34597ae4b10a736963a51afbd03a4be8a19045fa713f7e58d2d91
{% endblock %}

{% block bld_tool %}
bld/make
{% endblock %}

{% block patch %}
{{super()}}
cat .cargo/config
rm .cargo/config
{% endblock %}
