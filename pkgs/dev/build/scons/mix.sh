{% extends '//mix/template/std/mix.sh' %}

{% block fetch %}
https://files.pythonhosted.org/packages/be/d0/bf4e7003369c6d8a6e490741c54791c7918d9ef10b56aec201e76706f1d7/SCons-4.1.0.post1.tar.gz
2b1daf6c83e467ae41c742f546c2fe5a
{% endblock %}

{% block run_deps %}
dev/tool/python
{% endblock %}

{% block build %}
cd ${out}; mkdir bin; cd bin

extract0 ${src}/SCons*
ln -s SCons* sconsdir

cat << EOF > scons
#!$(which dash)
PYTHONPATH=${PWD}/sconsdir python3 $(pwd)/sconsdir/SCons/__main__.py "\$@"
EOF

chmod +x scons
{% endblock %}
