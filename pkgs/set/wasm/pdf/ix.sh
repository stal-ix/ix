{# the pure PDF module, for a host-side `ix run`: the module carries its
   target here, so the realm around it stays a host realm #}

{% extends '//die/hub.sh' %}

{% block run_deps %}
lib/pdf/ium/wasm(target=wasm32-none,kind=lib)
{% endblock %}
