{% extends '//lib/wlroots/16/ix.sh' %}

{% block fetch %}
https://github.com/hyprwm/Hyprland/releases/download/v0.28.0/source-v0.28.0.tar.gz
sha:baf355cb4e301b27de59fa5fc503b7338eed1bc921fcf76b73629504a00ffefd
{% endblock %}

{% block step_unpack %}
{{super()}}
cd subprojects/wlroots
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/display/info
{% endblock %}
