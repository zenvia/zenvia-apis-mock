FROM rodolpheche/wiremock

ADD ./wiremock/__files /home/wiremock/__files
ADD ./wiremock/mappings /home/wiremock/mappings

#CMD [ "--verbose" ]