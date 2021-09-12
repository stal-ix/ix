# bld env/c/nort boot/final/env
{% if mix.platform.target.os == 'linux' %}
# bld lib/musl
{% endif %}
{% include '//util/build_compiler_rt.sh' %}
