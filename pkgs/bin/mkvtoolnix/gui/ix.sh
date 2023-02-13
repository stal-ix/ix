{% extends '//bin/mkvtoolnix/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/qt/6/deps
lib/qt/6/multimedia/ffmpeg
{% endblock %}

{% block build %}
{{super()}}
touch doc/man/mkvtoolnix-gui.1
{% endblock %}

{% block configure_flags %}
{{super()}}
--enable-gui
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv bin old
mkdir bin
mv old/mkvtoolnix-gui bin/
rm -rf old
{% endblock %}
