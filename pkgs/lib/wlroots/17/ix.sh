{% extends '//lib/wlroots/16/ix.sh' %}

{% block fetch %}
https://github.com/hyprwm/Hyprland/releases/download/v0.27.1/source-v0.27.1.tar.gz
sha:69cbda21627c74bb7eb2a6ab9d967eb982152752b27e3f01ce08b0fa32d20b5b
{% endblock %}

{% block step_unpack %}
{{super()}}
cd subprojects/wlroots
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/display/info
{% endblock %}
