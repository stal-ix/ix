{% extends '//lib/python/3/10/mix.sh' %}

{% block lib_deps %}
{% endblock %}

{% block bld_libs %}
lib/z/mix.sh
{% if target.os == 'linux' %}
lib/linux/mix.sh
{% endif %}
{% if target.os == 'darwin' %}
lib/darwin/framework/SystemConfiguration/mix.sh
{% endif %}
{% endblock %}

{% block bld_tool %}
dev/build/autoconf/2/69/mix.sh
dev/build/automake/1.16.3/mix.sh
dev/build/autoconf/archive/mix.sh
{% endblock %}

{% block std_env %}
env/std/0/mix.sh
{% endblock %}

{% block autohell_env %}
env/std/0/mix.sh
{% endblock %}

{% block extra_modules %}
{% endblock %}

{% block extra_tests %}
{% endblock %}

{% block patch_ffi %}
{% endblock %}

{% block setup %}
{% endblock %}

{% block install %}
{{super()}}
find ${out}/ | grep '\.a$' | xargs rm
{% endblock %}

{% block env %}
{% endblock %}
