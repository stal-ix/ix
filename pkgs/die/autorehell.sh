{% extends 'autohell.sh' %}

{% block conf_ver %}{% endblock %}
{% block make_ver %}{% endblock %}

{% block patch_configure %}
{% block autoreconf %}
{% if not boot %}
for x in {% block purge_autohell %}configure config.guess config.sub install-sh{% endblock %}; do
    find . -type f -name ${x} -delete
done

if test -f autogen.sh; then
    NOCONFIGURE=1 sh autogen.sh
else
    libtoolize -ci
    autoreconf -if
fi
{% endif %}
{% endblock %}
{{super()}}
{% endblock %}

{% block std_box %}
bld/auto(conf_ver={{self.conf_ver().strip()}},make_ver={{self.make_ver().strip()}})
{{super()}}
{% endblock %}
