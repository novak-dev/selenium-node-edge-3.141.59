FROM selenium/node-base:3.141.59-selenium
LABEL authors="SeleniumHQ, novakivanovski"

USER root

#============================================
# Microsoft Edge latest stable - using regex to parse the latest version
# Instructions from https://www.microsoftedgeinsider.com/en-us/download/
#============================================
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'
RUN rm microsoft.gpg
RUN apt update

RUN echo `apt-cache policy microsoft-edge-stable | grep -Po1 'Candidate: \K\d+\.\d+\.\d+\.\d+-\d+'` > ./edge-version
RUN echo `apt-cache policy microsoft-edge-stable | grep -Po1 'Candidate: \K\d+\.\d+\.\d+\.\d+'` > ./driver-version
RUN apt install microsoft-edge-stable=`echo $(cat ./edge-version)` -y
RUN chmod +x /usr/bin/microsoft-edge

#=================================
# Microsoft Edge Script Wrapper
#=================================
COPY wrap_edge_binary /opt/bin/wrap_edge_binary
RUN /opt/bin/wrap_edge_binary

#============================================
# EdgeDriver - latest stable
#============================================
RUN wget -O driver.zip https://msedgewebdriverstorage.blob.core.windows.net/edgewebdriver/`echo $(cat ./driver-version)`/edgedriver_linux64.zip \ 
 && unzip driver.zip \
 && mv msedgedriver /usr/bin/msedgedriver \
 && chmod +x /usr/bin/msedgedriver \ 
 && rm driver.zip \
 && mv Driver_Notes /home/seluser/


# After extensive debugging, it seems that edgedriver is not being picked up from the config or the system PATH.
# From the source code, we see MicrosoftWebDriver is also used, so creating a link will work.
# See: https://github.com/SeleniumHQ/selenium/blob/selenium-3.141.59/java/client/src/org/openqa/selenium/edge/EdgeDriverService.java
# Alternatively, could have set JAVA_OPTS -Dwebdriver.edge.driver
RUN ln -s /usr/bin/msedgedriver /usr/bin/MicrosoftWebDriver

COPY generate_config /opt/bin/generate_config
RUN /opt/bin/generate_config > /opt/selenium/config.json
User seluser

