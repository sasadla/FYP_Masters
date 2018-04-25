FROM sasadla/dana_ubuntu_image:latest 

LABEL "Maintainer" "Saarim Aatri Sadla"

COPY . /usr/local/bin/app

WORKDIR /usr/local/bin/app

RUN chmod +x ./run.bash

ENTRYPOINT ["./run.bash"]