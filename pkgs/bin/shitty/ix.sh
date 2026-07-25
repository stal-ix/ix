{% extends '//die/c/pybuild.sh' %}

{% block pkg_name %}
shitty
{% endblock %}

{% block git_repo %}
https://github.com/pg83/shitty
{% endblock %}

{% block git_commit %}
06bd29adf4664c262210ab8fffe91ba2580123b5
{% endblock %}

{% block git_sha %}
70a96c24991256f9d85bd49f4afd6b5ce8a4d579eb99fc388dab36a121d00580
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
