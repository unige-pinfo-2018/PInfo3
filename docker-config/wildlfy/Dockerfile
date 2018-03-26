FROM jboss/wildfly:latest

# ADD ./mysql-connector-java-5.1.32.jar ./config_wildfly.sh /opt/jboss/wildfly/

ADD ./customize.sh /opt/jboss/wildfly/
ADD ./commands.cli /opt/jboss/wildfly/

USER root
RUN groupadd -r wildfly-logs -g 433 && \
useradd -u 431 -r -g wildfly-logs -s /sbin/nologin -c "WildFly container logs" wildfly-logs

RUN mkdir -p /opt/jboss/wildfly/standalone/deployments
RUN chown wildfly-logs:wildfly-logs /opt/jboss/wildfly/standalone/deployments

# execute customization script
RUN /opt/jboss/wildfly/customize.sh

RUN rm -rf  /opt/jboss/wildfly/standalone/configuration/standalone_xml_history
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "--debug", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]


expose 8080
expose 8787
expose 9990
