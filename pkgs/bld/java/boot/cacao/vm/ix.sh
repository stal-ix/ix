{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
https://bitbucket.org/cacaovm/cacao
{% endblock %}

{% block git_commit %}
6c4694f9bd175386a8c451531e9a5ad97aa23b6f
{% endblock %}

{% block git_sha %}
7e9d793f584ad4420dfd74b0596768de059ad8b615d97ce323d3899b9827588d
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
bld/java/boot/classpath/99
bld/java/boot/classpath/99/dl
{% endblock %}

{% block configure_flags %}
--with-java-runtime-library-prefix=${GNU_CLASSPATH}
{% endblock %}

{% block bld_tool %}
bin/fastjar
bld/java/boot/ecj/3/javac
{% endblock %}
