{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/pop-os/cosmic-term/archive/90179d5a5f837b60406bcd20315bb8a81cc3bb7d.zip
{% endblock %}

{% block cargo_sha %}
d68aa5d12eadee32bac71e8fb52fed47ded5602b182cfd147e2d28fa39740000
{% endblock %}

{% block bld_tool %}
bld/fakegit
{% endblock %}

{% block build %}
export VERGEN_GIT_COMMIT_DATE="x"
export VERGEN_GIT_SHA="x"
{{super()}}
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland/dl
lib/mesa/gl/dl
lib/drivers/3d
lib/mesa/egl/dl
lib/xkb/common/dl
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/cosmic-term ${out}/bin/
{% endblock %}
