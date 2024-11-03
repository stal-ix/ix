{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/cosmic/bg
bin/cosmic/edit
bin/cosmic/comp
bin/cosmic/term
bin/cosmic/files
bin/cosmic/panel
bin/cosmic/launcher
bin/cosmic/applibrary
bin/cosmic/workspaces
bin/cosmic/notifications
{% endblock %}

{% block run_data %}
bin/cosmic/icons
{% endblock %}
