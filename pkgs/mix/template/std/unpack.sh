mkdir unp && cd unp

for s in ${src}/*; do
    case ${s} in
        *touch)
        ;;
        *.diff)
        ;;
        *.patch)
        ;;
        *)
            do_extract ${s}
        ;;
    esac
done

{% block unpack_chdir %}
cd .. && mv unp/* bld && cd bld
{% endblock %}
