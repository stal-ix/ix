{% extends '//bld/java/boot/jamvm/t/ix.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/jamvm/jamvm/JamVM%202.0.0/jamvm-2.0.0.tar.gz
76428e96df0ae9dd964c7a7c74c1e9a837e2f312c39e9a357fa8178f7eff80da
{% endblock %}

{% block bld_libs %}
{{super()}}
bld/java/boot/classpath/devel
bld/java/boot/classpath/devel/dl
{% endblock %}

{% block configure_flags %}
--disable-int-inlining
{{super()}}
{% endblock %}

{% block bld_tool %}
{{super()}}
bin/zip
bld/java/boot/ecj/3/javac
{% endblock %}

{% block patch %}
{{super()}}
rm src/classlib/gnuclasspath/lib/classes.zip
{% endblock %}
