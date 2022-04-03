{% extends '//bin/perl/host/mix.sh' %}

{% block bld_tool %}
bld/perl
{{super()}}
{% endblock %}

{% block build %}
make -j ${make_thrs} miniperl

cat << EOF > miniperl
#!$(which sh)
perl -I${PWD} "\$@"
EOF

chmod +x miniperl

{{super()}}
{% endblock %}
