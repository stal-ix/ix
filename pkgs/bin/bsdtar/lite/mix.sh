{% extends '//bin/bsdtar/mix.sh' %}

{% block lib_deps %}
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/bzip2
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin
ln -s bsdtar tar
ln -s bsdcpio cpio
{% endblock %}
