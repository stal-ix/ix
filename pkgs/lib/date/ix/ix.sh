{% extends '//lib/date/t/ix.sh' %}

{% block lib_deps %}
{{super()}}
lib/shim/fake/pkg(pkg_name=date,pkg_ver={{self.version().strip()}})
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|/usr/share/zoneinfo/uclibc|/etc/zoneinfo|' \
    -e 's|.*called /etc/localtime may.*|if (getenv("TZ")) {return locate_zone(getenv("TZ"));}|' \
    -i src/tz.cpp
{% endblock %}
