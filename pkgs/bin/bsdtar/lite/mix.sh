{% extends '//bin/bsdtar/mix.sh' %}

{% block lib_deps %}
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/bzip2
{% endblock %}

{% block bld_tool %}
bld/autohell
{% endblock %}

{% block configure_flags %}
--without-xml2
--without-expat
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin
ln -s bsdtar tar
ln -s bsdcpio cpio
{% endblock %}
