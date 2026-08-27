{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gtk-doc
{% endblock %}

{% block version %}
1.36.1
{% endblock %}

{% block fetch %}
https://github.com/GNOME/gtk-doc/archive/refs/tags/{{self.version().strip()}}.tar.gz
9e5f6dd212ca2c31bd0ee804ba9672f00d30cad12c03f9aba9d15e9f74134dc4
{% endblock %}

{% block bld_libs %}
lib/python
pip/pygments
{% endblock %}

{% block bld_tool %}
bin/xsltproc
{% endblock %}

{#
TODO(pg): fix bin refs

pg-> cat config.py
version = "1.32"

# tools
dblatex = ''
fop = ''
pkg_config = '/ix/store/r4ASLogzC0nAm1u1-bin-pkg-config/bin/pkg-config'
xsltproc = '/ix/store/QhqWsRCXUZSUbpPI-bin-xsltproc/bin/xsltproc'

# configured directories
prefix = '/ix/store/eJ231NzIF7V5qO5z-bin-gtk-doc'
datarootdir = "${prefix}/share".replace('${prefix}', prefix)
datadir = "${datarootdir}".replace('${datarootdir}', datarootdir)

exeext = ''
#}

{% block meson_flags %}
yelp_manual=false
tests=false
{% endblock %}

{% block postinstall %}
# relocate it
sed -e 's|pkg_config = .*|pkg_config = "pkg-config"|' \
    -e 's|xsltproc = .*|xsltproc = "xsltproc"|' \
    -i ${out}/share/gtk-doc/python/gtkdoc/config.py
{% endblock %}
