{% extends '//lib/wlroots/16/ix.sh' %}

{% block fetch %}
https://github.com/hyprwm/Hyprland/releases/download/v0.27.0/source-v0.27.0.tar.gz
sha:d3d11572ba51e4248e653e22034052ed371b8b3dac1a731d3506ebdfb41e6ccf
{% endblock %}

{% block step_unpack %}
{{super()}}
cd subprojects/wlroots
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/display/info
{% endblock %}
