{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/twvd/snow/archive/aa17746213d285e04251a4b904fab161a662d67f.zip
{% endblock %}

{% block cargo_sha %}
f81a8e2520eab747b6fc0f47ebcb891f8c13
{% endblock %}

{% block bld_libs %}
lib/sdl/2
lib/sdl/deps
{% endblock %}

{% block cargo_bins %}
snow
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
