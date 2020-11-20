FROM default-route-openshift-image-registry.apps.na45.prod.nextcle.com/openshift/python:3.6

LABEL Component="Python" Name="s2i-python" Version="v1" Release="1.0"

LABEL io.k8s.description="Python Mailer" io.k8s.display-name="Python Mailer" io.openshift.s2i.scripts-url="image:///usr/libexec/s2i" io.openshift.expose-services="8080:http"

USER root

ENV APP_DIR /opt/app-root/src

COPY ./.s2i/bin/ /usr/libexec/s2i
COPY *.py /opt/app-root/src
COPY *.txt /opt/app-root/src

RUN chown -R 1001:1001 $APP_DIR && chgrp -R 0 $APP_DIR && chmod -R g=u $APP_DIR && chmod +x /usr/libexec/s2i/assemble /usr/libexec/s2i/run /usr/libexec/s2i/usage

USER 1001

EXPOSE 8080
