{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://www.freedesktop.org/software/libinput/libinput-1.19.2.tar.xz
2c7f2aa4032bacb562a535b74829c56d
{% endblock %}

{% block bld_tool %}
dev/build/cmake/mix.sh
dev/build/pkg-config/mix.sh
{% endblock %}
