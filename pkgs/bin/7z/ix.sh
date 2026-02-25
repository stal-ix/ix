{% extends '//die/c/make.sh' %}

{% block version %}
26.00
{% endblock %}

{% block pkg_name %}
7z
{% endblock %}

{% block fetch %}
https://www.7-zip.org/a/7z{{self.version().strip().replace('.', '')}}-src.tar.xz
3e596155744af055a77fc433c703d54e3ea9212246287b5b1436a6beac060f16
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
{% if linux and x86_64 %}
bin/uasm
{% endif %}
{% endblock %}

{% block skip_dirs %}0{% endblock %}

{% block unpack %}
{{super()}}
cd CPP/7zip/Bundles/Alone2
{% endblock %}

{% block make_flags %}
-f
{% if linux and x86_64 %}
../../cmpl_gcc_x64.mak
MY_ASM=uasm
{% else %}
../../cmpl_gcc.mak
{% endif %}
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
