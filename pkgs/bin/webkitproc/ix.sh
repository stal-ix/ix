{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/webkitproc/unwrap(allocator=tcmalloc,gtk_ver=4,gtk_icons=aux/hicolor-icon-theme)
{% endblock %}
