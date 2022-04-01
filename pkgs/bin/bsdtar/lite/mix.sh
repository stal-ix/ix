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
bin/auto/conf/2/69
bin/auto/make/1/16
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
