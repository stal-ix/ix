{% extends '//die/hub.sh' %}

{# Everything the service executes. The runit script records this hub's uid,
   so rebuilding any of these rewrites the run file and pid1 restarts the
   mount on the new binaries. #}

{% block run_deps %}
set/pg/arc/scripts
set/pg/arc/client
bin/fusermount/sud
{% endblock %}
