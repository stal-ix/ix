{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/ec-/Quake3e
{% endblock %}

{% block git_commit %}
525a5ae69322c973268a1807fd9d9a3128fcfd4d
{% endblock %}

{% block git_sha %}
a08119cae889dacd8024b6b6091b0d589fe79285b2ec8fb170af3ab4ddddd051
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
