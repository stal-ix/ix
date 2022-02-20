{% extends 'autohell.sh' %}

{% block conf_ver %}
2/69
{% endblock %}

{% block make_ver %}
1/16
{% endblock %}

{% block patch_configure %}
{% block autoreconf %}
{% if not boot %}
for x in {% block purge_autohell %}configure config.guess config.sub install-sh{% endblock %}; do
    find . -type f -name ${x} -delete
done

if test -f autogen.sh; then
    sh autogen.sh
else
    libtoolize -ci
    autoreconf -if
fi
{% endif %}
{% endblock %}
{{super()}}
{% endblock %}

{% block std_box %}
bld/autohell
bin/auto/conf/{{self.conf_ver().strip()}}
bin/auto/make/{{self.make_ver().strip()}}
{{super()}}
{% endblock %}
