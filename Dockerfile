FROM selenium/node-base:3.141.59-selenium
LABEL authors="SeleniumHQ, novakivanovski"

USER root

#============================================
# Microsoft Edge 89.0.774.4
# Instructions from https://www.microsoftedgeinsider.com/en-us/download/
#============================================
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'
RUN rm microsoft.gpg
RUN apt update
RUN apt install microsoft-edge-dev=89.0.774.4-1 -y

#============================================
# EdgeDriver 89.0.774.4
#============================================
RUN wget -O driver.zip https://msedgewebdriverstorage.blob.core.windows.net/edgewebdriver/89.0.774.4/edgedriver_linux64.zip \ 
 && unzip driver.zip \
 && mv msedgedriver /usr/bin/msedgedriver \
 && chmod +x /usr/bin/msedgedriver \ 
 && rm driver.zip \
 && mv Driver_Notes /home/seluser/


COPY generate_config /opt/bin/generate_config
RUN /opt/bin/generate_config > /opt/selenium/config.json
User seluser

