{% extends 't/ix.sh' %}

{% block configure_flags %}
{{super()}}
--disable-doc
--disable-tests
--disable-tools
{% endblock %}

{% block env %}
export COFLAGS="--with-gnutls=${out} \${COFLAGS}"
{% endblock %}

{% block c_rename_symbol %}
{{super()}}
glthread_once_singlethreaded
glthread_recursive_lock_destroy_multithreaded
glthread_recursive_lock_init_multithreaded
glthread_recursive_lock_lock_multithreaded
glthread_recursive_lock_unlock_multithreaded
glthread_rwlock_destroy_multithreaded
glthread_rwlock_init_multithreaded
glthread_rwlock_rdlock_multithreaded
glthread_rwlock_unlock_multithreaded
glthread_rwlock_wrlock_multithreaded
hash_string
hash_lookup
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|+= src/gl|+= |' -i Makefile.am
{% endblock %}
