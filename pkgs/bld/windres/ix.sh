{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/windres/unwrap(bin_prefix={{for_target | defined('for_target')}}-)
{% endblock %}
