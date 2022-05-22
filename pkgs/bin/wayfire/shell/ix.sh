{% extends '//die/meson.sh' %}

{% block fetch %}
https://github.com/WayfireWM/wf-shell/archive/b5edd8b6e62bc70fad9a21d44d4b2e13431cedb8.zip
sha:7b3e694fe323de116742ebba52c5c365fcde872886847ff35d34ac9d201f4284
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk/3/mm
lib/wf/config
lib/gtk/layer/shell
{% endblock %}

{% block patch %}
sed -e 's|.*dep.*wayfire.*||' -i meson.build
{% endblock %}

{% block bld_tool %}
bin/wayland/protocols
{% endblock %}

{% block meson_flags %}
pulse=disabled
wayland-logout=false
{% endblock %}
