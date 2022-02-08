{% extends '//mix/template/proxy.sh' %}

{% block run_deps %}
bin/sched/10
{% endblock %}

{% block install %}
cd ${out}; mkdir -p etc/sche.d/10; cd etc/sche.d/10

cat << EOF > trashdir.sh
rm -rf /mix/trash/*
EOF
{% endblock %}
