FROM appleboy/docker-backup-database:0.0.1-postgres-9

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
