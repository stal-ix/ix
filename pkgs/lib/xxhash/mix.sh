{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/Cyan4973/xxHash/archive/refs/tags/v0.8.0.tar.gz
62310678857c30fcef4128f41f711f49
{% endblock %}

{% block bld_libs %}
lib/c++/mix.sh
{% endblock %}

{% block patch %}
sed -e 's|libxxhash.a libxxhash|libxxhash.a|' -i Makefile
{% endblock %}

{% block build %}
{{super()}}
>libxxhash.0.8.0.dylib
>libxxhash.0.8.0.so
{% endblock %}

{% block test %}
make NO_C90_TEST=true test
{% endblock %}

{% block env %}
export COFLAGS="--with-xxhash=${out} --with-libxxhash-prefix=${out} \${COFLAGS}"
{% endblock %}
