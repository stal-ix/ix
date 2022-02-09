{% extends '//bld/perl/t/mix.sh' %}

{% block std_box %}
bld/bootbox
{% endblock %}

{% block bld_tool %}
bld/perl/boot
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
