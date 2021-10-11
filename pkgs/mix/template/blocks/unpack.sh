mkdir bld && cd bld

for s in ${src}/*; do
    case $s in
        *touch)
        ;;
        *.diff)
        ;;
        *.patch)
        ;;
        *zip)
            ${unzip} ${s}
        ;;
        *)
            ${untar} ${s}
        ;;
    esac
done

cd *
