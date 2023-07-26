{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/ec-/Quake3e
{% endblock %}

{% block git_commit %}
525a5ae69322c973268a1807fd9d9a3128fcfd4d
{% endblock %}

{% block git_sha %}
25053f09e61068463a81f220077d28efe5fd84dea70c705eff52b4d660f9afcc
{% endblock %}

{% block bld_libs %}
lib/c
lib/curl
lib/sdl/2
lib/opengl
lib/sdl/deps
lib/vulkan/loader
lib/vulkan/headers
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|.*GL/glx.*||'   \
        -e 's|.*GLE.*glX.*||' \
        -i ${l}
done

sed -e 's|(.*checksum != pak_check.*)|(0)|' -i code/qcommon/files.c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp $(find ${tmp} -type f -name quake3e) ${out}/bin/
cp $(find ${tmp} -type f -name quake3e.ded) ${out}/bin/
{% endblock %}
