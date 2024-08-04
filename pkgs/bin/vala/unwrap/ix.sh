{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/vala/-/archive/0.56.17/vala-0.56.17.tar.bz2
sha:691721734b0c5a368fa82ce82b0de652d42aed2133cf9275fd66493365eaa1dd
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/gi/repository
{% endblock %}

{% block bld_data %}
lib/gi/repository/gir
lib/gi/files
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
