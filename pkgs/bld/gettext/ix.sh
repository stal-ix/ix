{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/tar
bld/gzip
{% if darwin %}
bld/gettext/unwrap(purec=darwin/c,libc=darwin/c)
{% else %}
bld/gettext/unwrap
{% endif %}
{% endblock %}
