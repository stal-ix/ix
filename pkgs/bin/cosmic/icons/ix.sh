{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://github.com/pop-os/cosmic-icons/archive/refs/tags/epoch-1.0.0-alpha.3.tar.gz
9ea2c484bb19a91fdd563363e69e37ea2d820178658e68d80c3a750f767eb4e5
{% endblock %}

{% block bld_tool %}
bin/just
{% endblock %}

{% block install %}
just prefix=${out} install
{% endblock %}
