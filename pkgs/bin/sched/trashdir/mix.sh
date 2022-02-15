{% extends '//mix/proxy.sh' %}

{% block run_deps %}
bin/sched(delay={{delay}})
{% endblock %}

{% block install %}
cd ${out}; mkdir -p etc/sche.d/{{delay}}; cd etc/sche.d/{{delay}}

cat << EOF > trashdir.sh
rm -rf /mix/trash/*
EOF
{% endblock %}
