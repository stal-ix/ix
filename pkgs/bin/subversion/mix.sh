{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://archive.apache.org/dist/subversion/subversion-1.14.1.tar.bz2
2eccc2c7451397e01a13682600af9563
{% endblock %}

{% block bld_libs %}
bin/subversion/libs(openssl=1)
{% endblock %}

{% block bld_tool %}
bld/python/2
{% endblock %}

{% block run_deps %}
bin/openssh
{% endblock %}

{% block setup %}
expat="$(find_pkg expat)"

export COFLAGS=$(echo "${COFLAGS}" | tr ' ' '\n' | grep -v expat | tr '\n' ' ')
export COFLAGS="${COFLAGS} --with-expat=${expat}/include:${expat}/lib:-lexpat"
{% endblock %}

{% block patch %}
rm autogen.sh
{% endblock %}

{% block setup_tools %}
ln -s $(which python2) python
{% endblock %}

{% block install %}
{{super()}}

{% if bin %}
rm -rf ${out}/share/pkgconfig
{% endif %}
{% endblock %}
