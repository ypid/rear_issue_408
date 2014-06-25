# Logs in this directory where created with version d33cc9c676b02552c12b602768c4cbf13fc03623

    Author: Gratien D'haese <gratien.dhaese@gmail.com>
    Date:   Wed Jun 25 16:17:25 2014

        define a new variable LANG_RECOVER in default.conf file which is used
        via LC_ALL=$LANG_RECOVER dsmc in the different script used by TSM workflow;
        script modified:

        - conf/default.conf
        - output/TSM/default/95_dsmc_save_result_files.sh
        - output/TSM/default/96_dsmc_verify_isofile.sh
        - restore/TSM/default/40_restore_with_tsm.sh
        - verify/TSM/default/40_verify_tsm.sh

     usr/share/rear/conf/default.conf                               | 5 +++++
     usr/share/rear/output/TSM/default/95_dsmc_save_result_files.sh | 4 ++--
     usr/share/rear/output/TSM/default/96_dsmc_verify_isofile.sh    | 4 ++--
     usr/share/rear/restore/TSM/default/40_restore_with_tsm.sh      | 2 +-
     usr/share/rear/verify/TSM/default/40_verify_tsm.sh             | 2 +-
     5 files changed, 11 insertions(+), 6 deletions(-)
