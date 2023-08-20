# Extend from the official Elixir image
FROM elixir:latest

# Set the desired user and group IDs
ARG USER_ID=1000
ARG GROUP_ID=1000

# Create a new user and group with the desired IDs
RUN echo "appuser:x:${USER_ID}:${GROUP_ID}::/app:/sbin/nologin" >> /etc/passwd \
    && echo "appuser:x:${GROUP_ID}:" >> /etc/group

WORKDIR /app

COPY . .

# Change ownership and permissions of the files
RUN chown -R appuser:appuser /app && chmod -R u+rw /app

# Switch to the non-root user
USER appuser



EXPOSE 4000