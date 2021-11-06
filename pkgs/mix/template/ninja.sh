{% extends 'template.sh' %}

{% set ninja_build_targets %}
{% block ninja_build_targets %}
{% endblock %}
{% endset %}

{% set ninja_install_targets %}
{% block ninja_install_targets %}
install
{% endblock %}
{% endset %}

{% block build %}
ninja -C _build -j ${make_thrs} {{mix.fix_list(ninja_build_targets)}}
{% endblock %}

{% block install %}
ninja -C _build {{mix.fix_list(ninja_install_targets)}}
{% endblock %}
