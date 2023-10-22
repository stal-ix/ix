{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ix/ci/unwrap(user={{user or 'ci'}},wd={{wd or '/home/ci'}})
{% endblock %}
