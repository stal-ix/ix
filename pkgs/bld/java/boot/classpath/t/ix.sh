{% extends '//die/c/autohell.sh' %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bin/fastjar
{% endblock %}

{% block configure_flags %}
--disable-Werror
--disable-gmp
--disable-gtk-peer
--disable-gconf-peer
--disable-plugin
--disable-dssi
--disable-alsa
--disable-gjdoc
{% endblock %}

{% block postinstall %}
mv ${out}/lib/classpath/*.a ${out}/lib/
rm -rf ${out}/lib/classpath
{% if lib %}
rm -rf ${out}/bin
{% endif %}
{% endblock %}

{% block env %}
export GNU_CLASSPATH=${out}
{% endblock %}

{% block c_rename_symbol %}
fabsf
{% endblock %}
