{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
axel
{% endblock %}

{% block version %}
2.17.14
{% endblock %}

{% block fetch %}
https://github.com/axel-download-accelerator/axel/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:f6f2a5369d78003ab162a774cff0be71096bea6929333a79c8168c82caced07d
{% endblock %}

{% block conf_ver %}
2/72
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/gettext
bin/auto/conf/archive
bld/fake(tool_name=txt2man)
{% endblock %}

{% block configure_flags %}
--with-ssl=openssl
{% endblock %}

{% block patch %}
sed -e 's|int |_Atomic |' -i src/random.c
{% endblock %}
