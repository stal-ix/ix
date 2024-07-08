{% extends '//lib/skia/t/ix.sh' %}

{% block gn_args %}
{{super()}}
skia_build_fuzzers=false
skia_enable_discrete_gpu=false
skia_enable_ganesh=false
skia_enable_gpu=false
skia_use_dng_sdk=false
skia_use_gl=false
skia_use_egl=false
{% endblock %}
