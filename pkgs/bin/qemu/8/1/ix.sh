{% extends '//bin/qemu/t/ix.sh' %}

{% block fetch %}
https://gitlab.com/qemu-project/keycodemapdb/-/archive/22b8996dba9041874845c7446ce89ec4ae2b713d/keycodemapdb-22b8996dba9041874845c7446ce89ec4ae2b713d.tar.bz2
sha:4bc07b2298b517c86fad4b9f7514748d864311db4c88e8453fff4944a6b880ac
{% endblock %}

{% block git_repo %}
https://github.com/qemu/qemu
{% endblock %}

{% block git_branch %}
v8.1.0
{% endblock %}

{% block git_sha %}
b4a67d01bb014460f7942bbaabc1864887b4fcb40eaa78cab44095eb2c6c7eac
{% endblock %}

{% block step_unpack %}
{{super()}}
cd subprojects
rm keycode*
extract 0 ${src}/*bz2
mv keycode* keycodemapdb
cd ..
sed -e 's|.*subdir.*tests.*||' -i meson.build
{% endblock %}

{% block patch1 %}
{{super()}}
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/fdt
{% endblock %}

{% block git_refine %}
rm roms/edk2/EmulatorPkg/Unix/Host/X11IncludeHack
{% endblock %}
