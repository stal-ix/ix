{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/wget
bin/make
bld/python
bin/git/unwrap
etc/user/nobody
etc/user/{{user}}
bin/ix/mirror/fetch
bin/ix/mirror/serve(from={{wd + '/data'}})
etc/services/runit(srv_dir={{'mirror_serve_' + port}},srv_user=nobody,srv_command=exec serve_ix_mirror)
etc/services/runit(srv_dir={{'mirror_fetch_' + port}},srv_user={{user}},srv_command=exec fetch_ix_mirror {{wd}})
{% endblock %}
