{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/djpohly/dwl/archive/refs/tags/v0.2.1.tar.gz
1930d1f8aa6b748863c2fbb6121b22c2
{% endblock %}

{% block bld_libs %}
lib/wlroots/14/mix.sh
lib/wayland/mix.sh
{% endblock %}

{% block bld_tool %}
dev/build/pkg-config/mix.sh
lib/wayland/protocols/mix.sh
{% endblock %}
