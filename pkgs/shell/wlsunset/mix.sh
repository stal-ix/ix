{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://git.sr.ht/~kennylevinsen/wlsunset/archive/0.2.0.tar.gz
63fbe599dad95084d7850efe7a063cc5
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
{% endblock %}

{% block bld_tool %}
lib/wayland/protocols
{% endblock %}
