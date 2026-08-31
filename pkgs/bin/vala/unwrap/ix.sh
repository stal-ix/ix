{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
vala
{% endblock %}

{% block version %}
0.56.19
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/vala/-/archive/{{self.version().strip()}}/vala-{{self.version().strip()}}.tar.bz2
69240bbf64c38f366cc31d40f038e694f9254c60ed32b8aed086e8686ba78016
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/gi/repository
{% endblock %}

{% block bld_data %}
lib/glib/gir
lib/gi/repository/gir
{% endblock %}

{% block bld_tool %}
bld/gir
bld/flex
bld/bison
bin/vala/bootstrap
bin/auto/conf/archive
{% endblock %}

{% block configure_flags %}
--disable-valadoc
{% endblock %}

{% block patch %}
cat << EOF > build-aux/git-version-gen
#/bin/sh
echo -n 0.56.17
EOF
chmod +x build-aux/git-version-gen
{% endblock %}
