{% extends '//die/c/autorehell.sh' %}

{% block version %}
0.56.18
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/vala/-/archive/{{self.version().strip()}}/vala-{{self.version().strip()}}.tar.bz2
sha:702e82db5cd462870a5d30ac3da415dd7156b084920b2e41e7ec61d36e2b5b98
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
