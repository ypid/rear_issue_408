# Logs in this directory where created with version 5f2a06d32c2af647ac996b56873001295f3f6c48
Author: Gratien D'haese <gratien.dhaese@gmail.com>
Date:   Mon May 19 09:18:40 2014

    change the make validate rule:
    changed "xarg bash -n" in "xargs -n bash -n" (thanks to Johannes Meixner for bringing this forward)
    related to issue #410

 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
