{% extends '//die/c/pybuild.sh' %}

{% block pkg_name %}
shitty
{% endblock %}

{% block git_repo %}
https://github.com/pg83/shitty
{% endblock %}

{% block git_commit %}
59f69588b0161f41425e3c33bf0a257a06c39bc0
{% endblock %}

{% block git_sha %}
3cc8264c1970d72dccf030b2e579f46a2e3d6b342813a7ba70af86924a966dca
{% endblock %}

{% block pybuild_target %}
st
{% endblock %}

{% block git_hook_1 %}
git config submodule.third_party/libstd.url https://github.com/pg83/std.git
{% endblock %}

{% block bld_libs %}
lib/c
lib/glfw
lib/freetype
lib/harfbuzz
lib/utf8/proc
lib/simd/utf
lib/linux/headers
lib/glfw/deps
lib/fontconfig
lib/vulkan/loader
lib/vulkan/drivers
lib/vulkan/headers
{% endblock %}

{% block bld_tool %}
bin/glslang
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
mkdir -p ${out}/share/applications
mkdir -p ${out}/share/icons/hicolor/scalable/apps
cp st ${out}/bin/
cp shitty.desktop ${out}/share/applications/
cp shitty.svg ${out}/share/icons/hicolor/scalable/apps/
{% endblock %}
