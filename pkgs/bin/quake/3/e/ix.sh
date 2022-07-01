{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/ec-/Quake3e/archive/525a5ae69322c973268a1807fd9d9a3128fcfd4d.zip
sha:ec2213c8031ac41a7efc7882a0d6f1b5496f104ffa1e5cf3923f4e6db097509e
{% endblock %}

{% block bld_libs %}
lib/c
lib/sdl/2
lib/opengl
lib/sdl/deps
lib/vulkan/loader
lib/vulkan/headers
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|.*GL/glx.*||' \
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
