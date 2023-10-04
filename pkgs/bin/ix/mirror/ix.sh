{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ix/mirror/unwrap(user={{user or 'mirror'}},wd={{wd or '/home/mirror/'}},port={{port or '8080'}})
{% endblock %}
