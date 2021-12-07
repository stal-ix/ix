{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://github.com/emersion/slurp/archive/refs/tags/v1.3.2.tar.gz
05e2d6c212b165897458a8aeec82d6db
{% endblock %}

{% block bld_libs %}
lib/wayland/mix.sh
lib/cairo/mix.sh
lib/xkbcommon/mix.sh
{% endblock %}

{% block bld_tool %}
dev/doc/scdoc/mix.sh
lib/wayland/protocols/mix.sh
{% endblock %}
