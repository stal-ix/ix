def package(mix):
    deps = [
        'boot/stage/4/clang',
    ]

    return {
        'build': {
            'script': mix.files.build_py,
            'depends': deps,
        },
        'runtime': {
            'depends': deps + [
                'boot/stage/1/which',
                'boot/stage/2/sed',
                'boot/stage/2/gawk',
                'boot/stage/2/grep',
                'boot/stage/2/coreutils',
                'boot/stage/3/dash',
                'boot/stage/3/diffutils',
                'boot/stage/3/findutils',
                'env/bootstrap',
            ],
        },
    }
