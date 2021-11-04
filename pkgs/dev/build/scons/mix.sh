{% extends '//mix/template/template.sh' %}

{% block fetch %}
https://files.pythonhosted.org/packages/be/d0/bf4e7003369c6d8a6e490741c54791c7918d9ef10b56aec201e76706f1d7/SCons-4.1.0.post1.tar.gz
2b1daf6c83e467ae41c742f546c2fe5a
{% endblock %}

{% block bld_deps %}
env/std/mix.sh
{% endblock %}

{% block run_deps %}
dev/lang/python/3/minimal/mix.sh
{% endblock %}

{% block build %}
cd ${out} && mkdir bin && cd bin && ${untar} ${src}/SCons* && ln -s SCons* sconsdir

cat << EOF > scons
#!$(command -v dash)
PYTHONPATH=${PWD}/sconsdir python3 $(pwd)/sconsdir/SCons/__main__.py "\$@"
EOF

chmod +x scons
{% endblock %}
