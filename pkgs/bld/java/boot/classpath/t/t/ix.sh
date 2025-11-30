{% extends '//die/c/autorehell.sh' %}

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

{% block install %}
{{super()}}
{% if lib %}
mv ${out}/lib/classpath/*.a ${out}/lib/
rm -rf ${out}/lib/classpath
{% endif %}
{% endblock %}

{% block env %}
{% if bin %}
export GNU_CLASSPATH=${out}
{% else %}
export JNI_DIR=${out}
{% endif %}
{% endblock %}

{% block c_rename_symbol %}
fabsf
{% endblock %}
