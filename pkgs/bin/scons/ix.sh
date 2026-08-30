{% extends '//die/std/ix.sh' %}

{% block pkg_name %}
SCons
{% endblock %}

{% block version %}
4.11.1
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/scons/scons/{{self.version().strip()}}/SCons-{{self.version().strip()}}.tar.gz
4210d1a80a62e986029208117991b6347ccaaaab37b67463a3ff31ee065dc487
{% endblock %}

{% block install %}
cd ${out}; mkdir bin; cd bin

extract1 ${src}/SCons*

sed -e "s|= 'ar'| = SCons.Tool.find_program_path(env, 'ar')|" -i SCons/Tool/ar.py

cat << EOF > scons
#!/usr/bin/env sh
PYTHONPATH=${PWD} python3 ${PWD}/SCons/__main__.py "\${@}"
EOF

chmod +x scons
{% endblock %}
