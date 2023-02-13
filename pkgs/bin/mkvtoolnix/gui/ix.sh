{% extends '//bin/mkvtoolnix/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/qt/6/deps
lib/qt/6/multimedia
{% endblock %}

{% block build %}
{{super()}}
touch doc/man/mkvtoolnix-gui.1
{% endblock %}

{% block configure_flags %}
{{super()}}
--enable-gui
{% endblock %}
