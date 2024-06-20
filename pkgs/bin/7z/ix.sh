{% extends '//die/c/make.sh' %}

{% block fetch %}
https://www.7-zip.org/a/7z2407-src.tar.xz
sha:d1b0874a3f1c26df21c761a4a30691dc1213e8577f18ee78326c14ca4d683e2b
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
