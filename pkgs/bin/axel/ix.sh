{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/axel-download-accelerator/axel/archive/refs/tags/v2.17.13.tar.gz
sha:b10cb89b8a6b31fab2e5183c7a461a95691c5a5344d466f4ef47aa62e5c456a2
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
