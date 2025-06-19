{% extends '//bin/cosmic/t/ix.sh' %}

{% block cargo_url %}
https://github.com/pop-os/cosmic-comp/archive/refs/tags/epoch-1.0.0-alpha.3.tar.gz
{% endblock %}

{% block cargo_sha %}
18136b41377687126bffae2cf89892586c1b2e36584a6488a93a034b7ef2828f
{% endblock %}

{% block bld_libs %}
lib/seat
lib/udev
lib/input
lib/pixman
{{super()}}
{% endblock %}

{% block cargo_bins %}
cosmic-comp
{% endblock %}
