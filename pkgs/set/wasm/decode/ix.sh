{# the pure wasm decoders, for a host-side `ix run`: the modules carry
   their target here, so the realm around them stays a host realm #}

{% extends '//die/hub.sh' %}

{# a selector with its own target starts from empty flags: what the module
   takes from `ix run set/wasm/decode --simd128=1` is passed on by name #}
{% block run_deps %}
lib/image/magick/wasm(target=wasm32-none,kind=lib,simd128={{simd128}})
{% endblock %}
