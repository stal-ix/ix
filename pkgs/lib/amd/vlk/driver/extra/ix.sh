{% extends '//die/c/ix.sh' %}

{% block lib_deps %}
lib/c
lib/wayland
{% endblock %}

{% block bld_tool %}
bld/wayland
bld/librarian
{% endblock %}

{% block step_unpack %}
mkdir src
cd src
{% endblock %}

{% block build %}
set -xue
find ${WL_PROTOCOL_DIR} -type f -name '*.xml' | while read l; do
    wayland-scanner private-code ${l} $(basename ${l}).c
done
find . -type f -name '*.c' | while read l; do
    cc -c ${l}
done
ar q libwaylandextra.a *.o
patchns libwaylandextra.a wayproto_
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp *.a ${out}/lib/
{% endblock %}
