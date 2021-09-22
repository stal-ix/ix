{% extends '//util/template.sh' %}

{% block fetch %}
# url https://github.com/pg83/mix/archive/2654acc963d79af00f0a71ce9e21d2c469b64873.zip
# md5 e3ec97bf3b0b4995e7353d0bc7ef70ff
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
