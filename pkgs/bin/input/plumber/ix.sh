{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/ShadowBlip/InputPlumber/archive/refs/tags/v0.46.0.tar.gz
{% endblock %}

{% block cargo_sha %}
e422637a9b188669e0fc9fc23cefe18078b1ac003b61121149adac24ec8f230f
{% endblock %}

{% block bld_libs %}
lib/iio
lib/evdev
lib/llvm/19
{% endblock %}

{% block host_libs %}
{{super()}}
lib/llvm/19
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/llvm/config
bld/rust/helpers/patch/bindgen
{% endblock %}

{% block patch %}
{{super()}}
patch_bindgen vendored
{% endblock %}
