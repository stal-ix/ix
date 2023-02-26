{% extends '//die/hub.sh' %}

{% block run_deps %}
#bin/webkitproc(opt=O0,buildtype=debug,skipsrc=1,nostrip=1)
#bin/epiphany/gui/fixdrv
bin/shepherd
bin/webkitproc
bin/epiphany/{{gtk_ver}}(allocator=tcmalloc)
bin/xdg/er/webkit(wrap=epiphany,prefix=shepherd)
{% endblock %}
