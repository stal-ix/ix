{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
xmlbird
{% endblock %}

{% block version %}
1.2.14
{% endblock %}

{% block fetch %}
https://github.com/johanmattssonm/xmlbird/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:fb0ea7b60400de3f50af803a71b971ac064bdb56a2b3e4e4bcbeb5c317dcb2d6
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block bld_tool %}
bin/vala
bld/python
bld/pkg/config
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block configure %}
python3 ./configure \
    --lib lib \
    --cc clang \
    --prefix ${out}
{% endblock %}

{% block build %}
python3 ./build.py
{% endblock %}

{% block install %}
python3 ./install.py
{% endblock %}

{% block patch %}
sed -e 's|.*build_tests.*||' -i build.py
{% endblock %}
