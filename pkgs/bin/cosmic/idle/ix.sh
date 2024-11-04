{% extends '//bin/cosmic/t/ix.sh' %}

{% block cargo_url %}
https://github.com/pop-os/cosmic-idle/archive/refs/tags/epoch-1.0.0-alpha.3.tar.gz
{% endblock %}

{% block cargo_sha %}
484b3315084bf8ef4b07c86c5bad0287433b8b4388dbe0d0dc5e3a5192495eaf
{% endblock %}

{% block bld_libs %}
lib/wayland/dl
lib/xkb/common/dl
{% endblock %}
