{% extends '//bin/patch/ix.sh' %}

{% block version %}
2.7.6
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/patch/patch-{{self.version().strip()}}.tar.xz
sha:ac610bda97abe0d9f6b7c963255a11dcb196c25e337c61f94e4778d632f1d8fd
{% endblock %}

{% block bld_deps %}
bld/boot/5/sed
bld/boot/5/mawk
bld/boot/5/byacc
bld/boot/4/env
{% endblock %}
