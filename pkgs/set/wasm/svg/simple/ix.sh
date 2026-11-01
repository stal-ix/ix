{# the pure SVG module, for a host-side `ix run`: the module carries its
   target here, so the realm around it stays a host realm #}

{% extends '//die/hub.sh' %}

{# a selector with its own target starts from empty flags: what the module
   takes from `ix run set/wasm/svg/simple --simd128=1` is passed on by name #}
{% block run_deps %}
lib/svg/wasm/simple(target=wasm32-none,kind=lib,simd128={{simd128}})
{% endblock %}
