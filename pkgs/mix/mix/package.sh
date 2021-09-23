{% extends '//util/template.sh' %}

{% block fetch %}
# url https://github.com/pg83/mix/archive/f1debd96d9bbff75a9bd78f8a0735db84e5578b9.zip
# md5 0c2b83b57bec9689fd34666d99e82660
{% endblock %}

{% block deps %}
# lib dev/lang/python3 pypi/pygments pypi/jinja2 shell/dash/minimal
# bld env/std
{% endblock %}

{% block build %}
mkdir ${out}/mix && mv * ${out}/mix/ && cd ${out}
mkdir bin && cd bin

cat << EOF > mix
#!$(which dash)
export PYTHONPATH="${PYTHONPATH}"
export PYTHONDONTWRITEBYTECODE=1

exec $(which python3) "${out}/mix/mix" "\$@"
EOF

chmod +x mix
{% endblock %}

{% block test %}
python3 -c 'import jinja2; import pygments;'
{% endblock %}
