FROM fedora:22

RUN dnf install -y git net-tools which python-websockify procps-ng hostname
RUN git clone https://github.com/kanaka/noVNC.git /novnc
ADD start.sh /start.sh
ADD self.pem /novnc/self.pem
RUN chmod u+x /start.sh

EXPOSE 6080

CMD [ "/start.sh" ]


