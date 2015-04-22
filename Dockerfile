#
# This is the official OpenShift Origin image. It has as its entrypoint the OpenShift
# all-in-one binary.
#
# The standard name for this image is openshift3_beta/ose
#
FROM openshift3_beta/ose-base

RUN yum install -y openshift && \
    yum clean all

RUN ln -s /usr/bin/openshift /usr/bin/openshift-deploy && \
    ln -s /usr/bin/openshift /usr/bin/openshift-experimental && \
    ln -s /usr/bin/openshift /usr/bin/openshift-docker-build && \
    ln -s /usr/bin/openshift /usr/bin/openshift-sti-build && \
    ln -s /usr/bin/openshift /usr/bin/openshift-router

ENV HOME /root
ENV OPENSHIFTCONFIG /var/lib/openshift/openshift.local.certificates/admin/.kubeconfig
WORKDIR /var/lib/openshift
ENTRYPOINT ["/usr/bin/openshift"]
