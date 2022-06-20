{% extends '//die/make.sh' %}

{% block fetch %}
https://7-zip.org/a/7z2200-src.tar.xz
sha:40969f601e86aff49aaa0ba0df5ce6fd397cf7e2683a84b591b0081e461ef675
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block unpack %}
mkdir src; cd src
extract 0 ${src}/*xz
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
{% endblock %}
