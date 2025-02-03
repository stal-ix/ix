{% extends '//die/gen.sh' %}

{% block install %}
cd ${out}
mkdir -p etc/sched/{{delay}}
cd etc/sched/{{delay}}
cat << EOF > builddir.sh
/bin/flock -nx /ix /bin/sh -c 'mv /ix/build/* /ix/trash/'
EOF
{% endblock %}
