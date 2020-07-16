FROM postgres

# Run the rest of the commands as the `postgres` user
USER postgres

ENV POSTGRES_PASSWORD ribamar
ENV POSTGRES_DB bd_mudanca

COPY init_sql/*.sql /docker-entrypoint-initdb.d/

# Expose the PostgreSQL port
EXPOSE 5432