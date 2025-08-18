{% extends '//die/hub.sh' %}

{% block run_deps %}
set/pg/secrets/scripts
etc/services/runit(srv_deps=set/pg/secrets/scripts,srv_dir=secrets,srv_user=pg,srv_command=exec lab_serve_secrets)
{% endblock %}
