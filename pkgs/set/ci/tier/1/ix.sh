{% extends '//die/hub.sh' %}

{# broken
bin/neo/vide
bin/zellij
#}

{% block run_deps %}
bin/resvg
bin/i3/status/rust
bin/shadowsocks/rust
bin/delta
bin/cproxy
bin/bore
bin/binocle
bin/jj
bin/eza
bin/git/ui
bin/coreutils/uutils
bin/mini/serve
bin/xplr
bin/tail/spin
bin/wez/term
bin/rio
{% endblock %}
