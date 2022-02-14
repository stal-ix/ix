{% extends '//mix/proxy.sh' %}

{% block run_deps %}
bin/sched(delay=100)
{% endblock %}

{% block install %}
cd ${out}; mkdir -p etc/sche.d/100; cd etc/sche.d/100

cat << EOF > trashdir.sh
rm -rf /mix/trash/*
EOF
{% endblock %}
