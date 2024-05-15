{% extends '//die/c/make.sh' %}

{% block fetch %}
https://www.7-zip.org/a/7z2405-src.tar.xz
sha:63f341cf80b8d287c6e945519b3da0fa75553c85572a471b7fa6e68f9a90b790
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block skip_dirs %}0{% endblock %}

{% block unpack %}
{{super()}}
cd CPP/7zip/Bundles/Alone2
{% endblock %}

{% block make_flags %}
-f ../../cmpl_gcc.mak
DISABLE_RAR_COMPRESS=1
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp $(find . -type f -name 7zz) ${out}/bin/
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block cpp_defines %}
_7ZIP_AFFINITY_DISABLE=1
Z7_AFFINITY_DISABLE=1
{% endblock %}

{% block patch %}
echo 'patch'
{% if not linux %}
for f in Common/FileStreams.cpp UI/Common/UpdateCallback.cpp; do
    sed -e 's|<sys/sysmacros.h>|<sys/types.h>|' -i ../../${f}
done
{% endif %}
{% endblock %}
