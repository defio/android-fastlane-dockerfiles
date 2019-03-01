FROM circleci/android:api-27

LABEL maintainer="nicola.de.fiorenze@live.it"

# Install fastlane dependencies
RUN mkdir -p /tmp/gem && \
    cd /tmp/gem && \
    touch Gemfile && \
    echo "source \"https://rubygems.org\"" >> Gemfile && \
    echo "gem \"fastlane\"" >> Gemfile && \
    echo "gem \"mini_portile2\"" >> Gemfile && \
    echo "gem \"nokogiri\"" >> Gemfile && \
    echo "gem \"google_drive\"" >> Gemfile && \
    echo "gem \"fastlane-plugin-google_drive\"" >> Gemfile && \
    bundle install && \
    rm -r /tmp/gem

# Install aws dependencies
RUN sudo apt-get -y install python3-pip  && \
    pip3 install --upgrade awscli --user

# export aws path
ENV PATH=~/.local/bin:$PATH

# install xmlstarlet
RUN  sudo apt-get -y install xmlstarlet  