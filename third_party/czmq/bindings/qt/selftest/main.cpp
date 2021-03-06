/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
*/
#include <QDebug>
#include "qczmq.h"

int main(int argc, char **argv)
{
    bool verbose;
    if (argc == 2 && streq (argv [1], "-v"))
        verbose = true;
    else
        verbose = false;

    qDebug() << "Running qczmq selftests...\n";

    QZactor::test (verbose);
    QZarmour::test (verbose);
    QZcert::test (verbose);
    QZcertstore::test (verbose);
    QZchunk::test (verbose);
    QZclock::test (verbose);
    QZconfig::test (verbose);
    QZdigest::test (verbose);
    QZdir::test (verbose);
    QZdirPatch::test (verbose);
    QZfile::test (verbose);
    QZframe::test (verbose);
    QZhash::test (verbose);
    QZhashx::test (verbose);
    QZiflist::test (verbose);
    QZlist::test (verbose);
    QZlistx::test (verbose);
    QZloop::test (verbose);
    QZmsg::test (verbose);
    QZpoller::test (verbose);
    QZproc::test (verbose);
    QZsock::test (verbose);
    QZstr::test (verbose);
    QZtimerset::test (verbose);
    QZtrie::test (verbose);
    QZuuid::test (verbose);

    qDebug() << "Tests passed OK\n";
    return 0;
}
/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
*/
