{% extends '//bin/qemu/t/ix.sh' %}

{% block fetch %}
https://gitlab.com/qemu-project/keycodemapdb/-/archive/22b8996dba9041874845c7446ce89ec4ae2b713d/keycodemapdb-22b8996dba9041874845c7446ce89ec4ae2b713d.tar.bz2
4bc07b2298b517c86fad4b9f7514748d864311db4c88e8453fff4944a6b880ac
{% endblock %}

{% block git_repo %}
https://github.com/qemu/qemu
{% endblock %}

{% block git_branch %}
v8.1.5
{% endblock %}

{% block git_sha %}
c104182920c06e0270c524bda1596a45502ee1f2779a56eae3c9e5956b4d30f9
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

{% block bld_libs %}
{{super()}}
lib/fdt
{% endblock %}
