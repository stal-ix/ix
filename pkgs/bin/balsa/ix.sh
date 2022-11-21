{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/webkitproc
bin/xdg/er/webkit(wrap=balsa)
bin/balsa/unwrap(gtk_ver=3,allocator=tcmalloc)
{% endblock %}
