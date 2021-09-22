{% extends '//util/template.sh' %}

{% block fetch %}
# url https://github.com/pg83/mix/archive/708357f50936cfc86d96b8b3b8d7710e45fb4850.zip
# md5 4a3b7c878cff0cd901d124ce5d46ddaf
{% endblock %}

{% block deps %}
# lib dev/lang/python3 pypi/pygments shell/dash/minimal
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
