{% extends '//mix/autorehell.sh' %}

{% block fetch %}
http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz
sha:3dce6601b495f5b3d45b59f7d2492a340ee7e84b5beca17e48f862502bd5603f
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
{% endblock %}

{% block bld_tool %}
bld/python
bin/re2c/3
bin/gettext
{% endblock %}

{% block patch %}
find . -type f | grep Makefile | while read l; do
    sed -e "s|\$.*re2c.*EXT)|re2c|" -i ${l}
done
{% endblock %}
