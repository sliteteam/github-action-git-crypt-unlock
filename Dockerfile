FROM zemuldo/git-crypt-unlock:latest

WORKDIR /opt/project

COPY entrypoint.sh .

ENTRYPOINT ["/opt/project/entrypoint.sh"]
