FROM bitnami/base-apps-ubuntu:14.04
MAINTAINER Bitnami <containers@bitnami.com>

ENV BITNAMI_APP_NAME=wordpress \
    BITNAMI_APP_VERSION=4.3.1-0 \
    BITNAMI_APP_USER=bitnami \
    BITNAMI_APPLICATION_USER=user \
    BITNAMI_APPLICATION_PASSWORD=bitnami \
    IS_BITNAMI_STACK=1

#Download latest WordPress Stack from bitnami.com
RUN sh $BITNAMI_PREFIX/install.sh \
    --base_user $BITNAMI_APPLICATION_USER --base_password $BITNAMI_APPLICATION_PASSWORD --apache_mpm_mode event --enable_phpfpm 1 --logrotate_install 1 --monit_install 1 && $BITNAMI_PREFIX/ctlscript.sh stop && \
    rm $BITNAMI_PREFIX/install.sh

EXPOSE 80 443 22

ENTRYPOINT ["/usr/bin/ghostbuster"]
CMD ["/bin/bash", "/start.sh"]
