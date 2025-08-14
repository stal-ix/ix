{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
shotman
{% endblock %}

{% block version %}
0.4.10
{% endblock %}

{% block cargo_url %}
https://git.sr.ht/~whynothugo/shotman/archive/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
50484ee97cb2f675ab57072dc02c6435b00dc47d93d5b624868bfb5e485d47f9
{% endblock %}

{% block bld_libs %}
lib/xkb/common
{% endblock %}

{% block cargo_bins %}
shotman
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}
