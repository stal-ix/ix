{% extends '//bin/mkvtoolnix/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/qt/6/multimedia
{% endblock %}

{% block configure_flags %}
{{super()}}
--disable-gui
{% endblock %}
