{% extends '//die/c/make.sh' %}

{% block pkg_name %}
dcron
{% endblock %}

{% block version %}
4.6
{% endblock %}

{% block fetch %}
https://github.com/ptchinster/dcron/archive/refs/tags/v{{self.version().strip()}}.tar.gz
d1dced1554213225f5ca333ebc5eab96ab80fa30800d9420782d5dfa6e2a15e7
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block patch %}
sed -e 's|-o root||' -e 's|-g root||' \
    -e 's|-g $(CRONTAB_GROUP)||'      \
    -e 's|.*INSTALL_DIR.*|| ' -i Makefile
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv sbin/* bin/
rm -rf sbin
{% endblock %}
