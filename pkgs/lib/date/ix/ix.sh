{% extends '//lib/date/t/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/scripts/genpc
{% endblock %}

{% block install %}
{{super()}}
genpc "date" "{{self.version()}}"
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|/usr/share/zoneinfo/uclibc|/etc/zoneinfo|' \
    -e 's|.*called /etc/localtime may.*|if (getenv("TZ")) {return locate_zone(getenv("TZ"));}|' \
    -i src/tz.cpp
{% endblock %}
