def package(mix):
    return {
        'build': {
            'script': mix.files.build_sh,
            'fetch': [
                {
                    'url': 'https://ftp.gnu.org/gnu/bison/bison-3.6.1.tar.xz',
                    'md5': '16fa3e60f2c33888c6ef7af64c89e182',
                },
            ],
            'depends': [
                'lib/intl',
                'dev/lang/m4',
                'dev/lang/flex',
                'dev/lang/perl5',
                'dev/lang/bison/351/stage1',
                'dev/build/make',
                'env/std',
            ],
        },
    }
