{% extends '//bin/cosmic/t/ix.sh' %}

{% block cargo_url %}
https://github.com/pop-os/cosmic-panel/archive/refs/tags/epoch-1.0.0-alpha.3.tar.gz
{% endblock %}

{% block cargo_sha %}
99d22c51735bbee8f638fc4a46908d6d8cdf6e8fb2ed641fd54b94a4ef600daa
{% endblock %}

{% block bld_libs %}
lib/c
lib/xkb/common
lib/wayland/dl
lib/wayland/dl/server
{% endblock %}
