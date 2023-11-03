{% extends '//die/proxy.sh' %}

{% block run_deps %}
bin/sched(delay={{delay}})
{% endblock %}

{% block install %}
cd ${out}; mkdir -p etc/sche.d/{{delay}}; cd etc/sche.d/{{delay}}

cat << EOF > trash_dir_{{trash_dir | b64e}}.sh
rm -rf {{trash_dir}}/*
EOF
{% endblock %}
