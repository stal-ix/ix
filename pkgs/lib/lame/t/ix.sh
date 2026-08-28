{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
lame
{% endblock %}

{% block version %}
4.0
{% endblock %}

{% block conf_ver %}
2/72
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/lame/lame/{{self.version().strip()}}/lame-{{self.version().strip()}}.tar.gz
3df5124d5ad3a98312ffd7ba6a9b36230e4f8a3e66d3ce0f425e336c32d216eb
{% endblock %}

{% block lib_deps %}
lib/c
lib/mpg123
{% endblock %}

{% block bld_tool %}
bld/nasm
bld/gettext
{% endblock %}

{% block patch %}
patch -p1 <<'EOF'
{% include 'id3v2-utf8.patch' %}
EOF
{% endblock %}

{% block configure_flags %}
--enable-nasm
{% endblock %}
